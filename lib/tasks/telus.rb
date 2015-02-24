require_relative "scraper"

class Telus < Scraper

	def initialize
		@retailer = get_retailer("Telus")
		@contract = get_contract("Telus")
		@active_devices = Device.where(active:true)
	end

	def run
		@active_devices.each do |dev|

			metadatas = Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

			metadatas.each do |m|
				page = get_agent.get(m.detail)
				price = page.at('.price-text').text.delete('$')
				save_summary(@contract.id, @retailer.id, price, dev.id, m.detail, nil)
			end
		end
	end
end