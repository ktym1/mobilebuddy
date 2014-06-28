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
            metadatas.each do |m|
	            page = get_agent.get(m.detail)
	            price = 0
                puts dev.display_name
				if ((dev.display_name == "Iphone 5C") || (dev.display_name == "Iphone 5S"))
					browser = Watir::Browser.new :phantomjs
					device_name = dev.display_name.delete(' ').downcase
					browser.goto m.detail   
					path =  "//*[@id='#{device_name}_tab']/div[1]/div[2]/div/div[5]"          
				    price = browser.element(:xpath => path).text
			    else       		
					price = page.search(".price_moredetails")
	           	end
	            save_summary(@contract.id, @retailer.id,price,dev.id,m.detail)
		    end
        end
	end
end

