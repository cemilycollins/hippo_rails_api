namespace :duplicate do

  desc "Add duplicate data to HospitalProcedure records (hospital name, city, etc.)"
  task hospital_procedures: :environment do
    HospitalProcedure.all.each do |hp|
      hp.hospital_name = hp.hospital.name
      hp.hospital_state = hp.hospital.state
      hp.hospital_city = hp.hospital.city
      hp.hospital_avg_rating = hp.hospital.rating_average
      hp.total_hospitals = hp.procedure.total_hospitals
      hp.procedure_name = hp.procedure.name
      hp.nat_avg_cost = hp.procedure.nat_avg_cost
      hp.save
    end
  end
end
