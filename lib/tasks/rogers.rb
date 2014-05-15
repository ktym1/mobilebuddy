require_relative "scraper"

class Rogers < Scraper

	def initialize 
		@retailer = Retailer.where(name: "Rogers").take
		@contract = Contract.find_by_name("Rogers")
	end

	def run
		browser = Watir::Browser.new :phantomjs
		devices = Device.all

		devices.each do |dev|
           metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)
           metadatas.each do |m|
           	 browser.goto "http://www.rogers.com/web/link/wirelessBuyFlow?forwardTo=PhoneThenPlan&productType=normal&productId_Detailed="+m.detail
           	 price = browser.div(:id => 'NetPriceBig').text.to_s.delete('$')
           	 promotion_link = browser.url
           	 price = (price.to_f / 100)
           	 
           	 save_summary(price, dev.id, promotion_link)

           end
		end
	end

	def save_summary(price,dev_id,link)
		 Summary.create(price: price, 
				           contract_id: @contract.id, 
				           device_id: dev_id,
				           retailer_id: @retailer.id,
				           promotion_link: link.to_s 
				           )
	end
end
