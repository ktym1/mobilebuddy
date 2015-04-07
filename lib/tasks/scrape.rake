require 'bell'
require 'telus'
require 'wirelesswave'

namespace :scrape do
  
	desc "Get data from bell's website"
	task bell: :environment do
		bell = Bell.new
		bell.run
	end

	desc "Get data from Wireless Wave's website"
	task wave: :environment do
		w = WirelessWave.new
		w.run
	end

	desc "Get data from Telus' website"
	task telus: :environment do
		telus = Telus.new
		telus.run     
	end

end