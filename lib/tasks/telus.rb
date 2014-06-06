require_relative "scraper"

class Telus < Scraper

	def initialize
		@retailer = Retailer.where(name: "Telus").take
		@contract = Contract.find_by_nae("Telus")
	end

	def run
		devices = Device.where(active: true)
		devices.each do |dev|

			metadatas = Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

			metadatas.each do |m|
				page = get_agent.get(m.detail)
				array = page.search('.nobr price').children()
				price = array[]	
			
			end
		end
	end

end