require_relative 'scraper'

	class Virgin < Scraper
		def initialize
		@retailer = get_retailer('Virgin')
		@contract = get_contract('Virgin')
		end

		def run
			browser = Watir::Browser.new :phantomjs
			devices = Device.all

			devices.each do |dev|
				metadatas = Metadata.where(retailer_id: @retailer.id, device_id: dev.id)
				metadatas.each do |m|
					browser.goto "http://www.virginmobile.ca/en/phones/phone-details.html?model="+m.detail
					price = browser.div(:id =>"priceDisplayforSale").text
					puts price.inspect
			# devices = Device.where(active:true)
			# devices.each do |dev| 
			# 	metadatas = Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

			# 	metadatas.each do |m| 
			# 		page = get_agent.get(m.detail)
				# test = page.at("#priceDisplayforSale").children()
				# test.each{|p| puts p}

				# puts page.search('#priceDisplayforSale .price').text
				
			
				# gift_card = page.at('.productImage')

				# save_summary(@contract.id, @retailer.id, price, dev.id, m.detail, gift_card)
				end
			end
		end


	end