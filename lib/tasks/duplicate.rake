namespace :duplicate do

  desc "Add duplicate data to HospitalProcedure records (hospital name, city, etc.)"
  task hospital_procedures: :environment do
    Hospital.all.each do |h|
      if h.hospital_procedures.length > 0 && h.hospital_procedures.last.hospital_name == null
        h.hospital_procedures.each do |hp|
          procedure = hp.procedure
          hp.hospital_name = h.name
          hp.hospital_state = h.state
          hp.hospital_city = h.city
          hp.hospital_avg_rating = h.rating_average
          hp.total_hospitals = procedure.total_hospitals
          hp.procedure_name = procedure.name
          hp.nat_avg_cost = procedure.nat_avg_cost
          hp.save
        end
      end
    end
  end
end
