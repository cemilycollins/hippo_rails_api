require 'csv'

namespace :import do

  desc "Import hospitals and procedure records from csv"
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
end
