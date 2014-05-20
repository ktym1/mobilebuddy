require_relative 'scraper'

class Bell < Scraper

	def initialize
	    @retailer = Retailer.where(name: 'Bell').take
	    @contract = Contract.find_by_name('Bell')
	end


	def run
		devices = Device.where(active: true)
		devices.each do | dev | 

		   metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

           metadatas.each do |m|
           	 page =	get_agent.get(m.detail)
           	 array = page.search('.priceGroup').children()
             price = array[3].text.delete('$')
             puts dev.name + " "+ dev.model
       	 	Summary.create(price: price, 
			           contract_id: @contract.id, 
			           device_id: dev.id,
			           retailer_id: @retailer.id,
			           promotion_link: m.detail 
			           )
           end
		end
	end
end