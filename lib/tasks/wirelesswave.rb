require_relative 'scraper'
class WirelessWave < Scraper

	def initialize
	    @retailer = Retailer.find_by_name('Wireless Wave')
	    @contract = "" 
	end

	def run
		
		devices = Device.all

		devices.each do |dev|
           metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

           metadatas.each do |m|
           	 page =	get_agent.get(m.detail)
           	 price = page.at("#contractprice-lg").text.delete('$')
           	 get_contract(m.detail)
           	 gift_card = page.at("#contractbonus").text if page.at("#contractbonus") != nil
             save_summary(price, dev.id, m.detail,gift_card)
           end
		end
	end


	def get_contract(contract_name)
		if(contract_name.include? "bell")
			@contract = Contract.find_by_name('Bell')
			puts "bell"
		elsif (contract_name.include? "rogers")
			@contract = Contract.find_by_name('Rogers')
			puts "Rogers"
		end	
	end


	def save_summary(price,dev_id,link, gift_card = "")
		 Summary.create(price: price, 
				           contract_id: @contract.id, 
				           device_id: dev_id,
				           retailer_id: @retailer.id,
				           gift_card: gift_card,
				           promotion_link: link.to_s 
				           )
	end

end