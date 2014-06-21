require_relative "scraper"

class Rogers < Scraper

	def initialize 
		@retailer = get_retailer('Rogers')
	    @contract = get_contract('Rogers')
	end

	def run
		browser = Watir::Browser.new :phantomjs
		devices = Device.where(active: true)

		devices.each do |dev|
           metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)
           metadatas.each do |m|
           	 browser.goto "http://www.rogers.com/web/link/wirelessBuyFlow?forwardTo=PhoneThenPlan&productType=normal&productId_Detailed="+m.detail
           	 price = browser.div(:id => 'NetPriceBig').text.to_s.delete('$')
           	 promotion_link = browser.url
           	 price = (price.to_f / 100)
           	 save_summary(@contract.id, @retailer.id,price,dev.id,promotion_link)
           end
		end
	end
end
