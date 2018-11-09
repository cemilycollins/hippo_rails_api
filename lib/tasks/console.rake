require 'pry'

namespace :console do

  desc 'drop into the Pry console'
  task :console => :environment do
    Pry.start
  end

end
