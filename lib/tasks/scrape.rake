require_relative 'bell'

namespace :scrape do
  desc "Get data from bell's website"
  task bell: :environment do
    bell = Bell.new
    bell.run
  end

end

namespace :scrape do
	desc "Get data from Roger's website"
	task rogers:, :environment do 
		rogers = Rogers.new
		rogers.run
	end
end