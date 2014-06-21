require_relative "scraper"

class Virgin < Scraper

	def initialize
		@retailer = get_retailer('Virgin')
		@contract = get_contract('Virgin')
	end

	def run
		browser = Watir::Browser.new :phantomjs
		devices = Device.where(active: true)

		devices.each do |dev|
			metadatas = Metadata.where(retailer_id: @retailer.id, device_id: dev.id)
			metadatas.each do |m|
				browser.goto m.detail
				price = browser.element(:xpath => '//*[@id="priceDisplayforSale"]/div/div[2]').text
				save_summary(@contract.id, @retailer.id,price,dev.id,m.detail)
			end
		end
	end


end