namespace :calculate do

  desc "Calculate hospital averages and totals"
  task hospitals: :environment do
    x = 0
    Hospital.all.each do |h|
      h.rating_average
      h.total_reviews
    end
    puts "Updated #{x} hospitals"
  end
end
