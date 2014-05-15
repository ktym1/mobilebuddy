require_relative "scraper"

class Rogers < Scraper

	def initialize 
		@retailer = Retailer.where(name: "Test").take
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
    
           	 Summary.create(price: price, 
				           contract_id: @contract.id, 
				           device_id: dev.id,
				           retailer_id: @retailer.id,
				           promotion_link: promotion_link.to_s 
				           )
           end
		end

		# browser.goto "http://www.rogers.com/web/Rogers.portal?_nfpb=true&_pageLabel=search&Ntt=iphone+5s+16gb"
        
        # puts browser.title
        # puts browser.url
        # cost = browser.div(:id => 'NetPriceBig').text.to_s.delete('$')
        # price = BigDecimal.new(cost)
       # puts sprintf('%D',cost)



		# devices.each do |dev| 

			# page = get_agent.get("http://www.rogers.com/web/Rogers.portal", {
			# 	:_nfpb => "true",
			# 	:_pageLabel => "search",
			# 	:Ntt => "{dev.name}+{dev.model}+16gb" 
			# 	})

			# puts page.body

			# promotion_link = page.links_with(:dom_class => "search_result")[0].click()
			# new_page = page.links_with(:dom_class => "search_result")[0].click()
			# puts new_page
		# end
	end
end

# /web/Rogers.portal?_nfpb=true&_pageLabel=search