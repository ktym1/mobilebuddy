require_relative 'scraper'
class WirelessWave < Scraper

	def initialize
	    @retailer = get_retailer('Wireless Wave')
	    @contract = "" 
	end

	def run
		
		devices = Device.where(active: true)

		devices.each do |dev|
           metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

           metadatas.each do |m|
           	 page =	get_agent.get(m.detail)
           	 price = page.at(".phoneDetail-price")
           	 get_carrier(m.detail)
           	 gift_card = page.at("phoneDetail-hotOffer").text if page.at("phoneDetail-hotOffer") != nil

             save_summary(@contract.id, @retailer.id,price,dev.id,m.detail,gift_card)
           end
		end
	end


	def get_carrier(contract_name)
		if(contract_name.include? "bell")
			@contract = get_contract('Bell')
		elsif (contract_name.include? "rogers")
			@contract = get_contract('Rogers')
		elsif (contract_name.include? "virgin")
			@contract = get_contract('Virgin')
		elsif (contract_name.include? "fido")
			@contract = get_contract('Fido')
		end	
	end

end