require_relative "scraper"

class Fido < Scraper

	def initialize 
		@retailer = get_retailer('Fido')
	    @contract = get_contract('Fido')
	end

	def run
		devices = Device.where(active:true)
		devices.each do |dev|

			metadatas = Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

				# if dev === "Iphone 5C"
					metadatas.each do |m|
						page = get_agent.get(m.detail)
							price = page.at(".price-number show2y5c")
			           		puts price.inspect
			    	end
			  #   else       		
					# metadatas.each do |m|
					# 	page = get_agent.get(m.detail)
					# 		price = page.search(".price_moredetails")
			  #          		puts price.text.strip
	    #        		end
	    #        	end
           	 # save_summary(@contract.id, @retailer.id,price,dev.id,promotion_link)
           
        end
	end
end

