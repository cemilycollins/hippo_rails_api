namespace :calculate do

  desc "Calculate hospital averages and totals"
  task hospitals: :environment do
    x = 0
    Hospital.all.each do |h|
      x += 1
      h.rating_average
      h.total_reviews
    end
    puts "Updated #{x} hospitals"
  end

  desc "Calculate procedure averages and totals"
  task procedures: :environment do
    x = 0
    Procedure.all.each do |p|
      x += 1
      p.nat_avg_cost
      p.total_discharges
      p.total_hospitals
    end
    puts "Updated #{x} procedures"
  end

  desc "Calculate hospital_procedure averages and totals"
  task hospital_procedures: :environment do
    x = 0
    HospitalProcedure.all.each do |h|
      x += 1
      h.hospital_avg_rating
      h.total_hospitals
      h.nat_avg_cost
    end
    puts "Updated #{x} hospital_procedures"
  end

end
