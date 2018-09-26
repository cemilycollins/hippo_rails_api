require 'csv'
require 'soda/client'

namespace :import do

  desc "Import hospitals from csv"
  task hospitals: :environment do
    filename = File.join Rails.root, 'Payment_and_value_of_care_-_Hospital.csv'
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      latlng = [nil, nil]
      if row["Location"].split("(")[1]
        latlng = row["Location"].split("(")[1].split(", ")
        latlng[1] = latlng[1].split(")")[0]
        latlng = latlng.map do |str|
          str.to_f
        end
      end

      h = Hospital.create(name: row["Hospital name"], street_address: row["Address"], latitude: latlng[0], longitude: latlng[1], city: row["City"], state: row["State"], zip_code: row["ZIP Code"].to_i, phone: row["Phone number"].to_i, provider_number: row["Provider ID"].to_i)
      counter += 1 if h.persisted?
    end
    puts "Created #{counter} hospitals"
  end

  desc "Import procedure records from API"
  task procedures: :environment do
    client = SODA::Client.new({:domain => "data.cms.gov", :app_token => "2ISI9YURJj5eLDYqH7BAhIexR"})
    counter = 0

    Hospital.all[0..3].each do |hospital|
      var = hospital.provider_number
      if var < 100000
        var = "0#{var}"
      end

      results = client.get("t8zw-d33c", :provider_id => "#{var}")

      if results[0].provider_state == hospital.state
        results.each do |record|
          nameArray = record.drg_definition.split(" - ")
          p = Procedure.find_or_create_by(name: nameArray[1]) do |procedure|
            procedure.procedure_number_string = nameArray[0]
          end
          hp = HospitalProcedure.create(hospital_id: hospital.id, procedure_id: p.id, average_covered_charges: record.average_covered_charges, average_medicare_payments: record.average_medicare_payments, average_total_payments: record.average_total_payments, total_discharges: record.total_discharges)
          counter += 1 if hp.persisted?
        end
      end
    end
    puts "Created #{counter} procedures"
  end

end
