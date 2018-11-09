namespace :duplicate do

  desc "Add duplicate data to HospitalProcedure records (hospital name, city, etc.)"
  task hospital_procedures: :environment do
    HospitalProcedure.all.each do |hp|
      hospital = hp.hospital
      procedure = hp.procedure
      hp.hospital_name = hospital.name
      hp.hospital_state = hospital.state
      hp.hospital_city = hospital.city
      hp.hospital_avg_rating = hospital.rating_average
      hp.total_hospitals = procedure.total_hospitals
      hp.procedure_name = procedure.name
      hp.nat_avg_cost = procedure.nat_avg_cost
      hp.save
    end
  end
end
