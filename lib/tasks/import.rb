namespace :import do
  desc "Import hospitals"
  task hospitals: :environment do
    counter = 0

    # inside the loop where you're fetching records
      h = Hospital.create(...)
      counter += 1 if h.persisted?
    # end of the loop

    puts "Created #{counter} hospitals"
  end
end
