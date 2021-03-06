require "scraper"

class Telus < Scraper

	def initialize
		super
		@retailer = get_retailer("Telus")
		@contract = get_contract("Telus")
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