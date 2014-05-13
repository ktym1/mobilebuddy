require_relative 'bell'
require_relative "rogers"

namespace :scrape do
  desc "Get data from bell's website"
  task bell: :environment do
    bell = Bell.new
    bell.run
  end


	desc "Get data from Roger's website"
	task rogers: :environment do 
		rogers = Rogers.new
		rogers.run
	end
end