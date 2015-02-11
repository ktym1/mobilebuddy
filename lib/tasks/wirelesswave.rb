require_relative 'scraper'
class WirelessWave < Scraper

	def initialize
	    @retailer = get_retailer('Wireless Wave')
	    @contract = "" 
	end

	def run
		
		devices = Device.where(active: true)

		devices.each do |dev|
       raw_text = page.at(".phoneDetail-price").text
       metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

       metadatas.each do |m|
       	 page =	get_agent.get(m.detail)
         price = get_price(raw_text)
          
       	 get_carrier(m.detail)
       	 gift_card = page.at(".phoneDetail-hotOffer").text || []
         save_summary(@contract.id, @retailer.id, price, dev.id, m.detail, gift_card)
       end
		end
	end

  def get_price(string)
    raw_text_array = string.split(//)
    price_elements = raw_text_array[2..4]
    price_elements.join.to_i
  end

	def get_carrier(contract_name)
		if(contract_name.include? "bell")
			@contract = get_contract('Bell')
		end	
	end

end