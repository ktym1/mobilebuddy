require_relative 'bell'
require_relative "rogers"
require_relative 'wirelesswave'
require_relative 'virgin'
require_relative 'telus'


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

	desc "Get data from Wireless Wave's website"
	task wave: :environment do
		w = WirelessWave.new
		w.run
	end


	desc "Get data from Virgin's website"
	task virgin: :environment do
		virgin = Virgin.new
		virgin.run
	end

	desc "Get data from Telus' website"
	task telus: :environment do
		telus = Telus.new
		telus.run     
	end

end