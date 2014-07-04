require_relative "scraper"

class Telus < Scraper

	def initialize
		@retailer = get_retailer("Telus")
		@contract = get_contract("Telus")
	end

	def run
		devices = Device.active
		devices.each do |dev|

			metadatas = Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

			metadatas.each do |m|
				page = get_agent.get(m.detail)

				price = page.at('.price span').text.delete('$')
				save_summary(@contract.id, @retailer.id,price,dev.id,m.detail)
			end
		end
	end
end