require_relative 'scraper'

class Bell < Scraper

	def initialize
	    @retailer = get_retailer('Bell')
	    @contract = get_contract('Bell')
	end


	def run
		devices = Device.where(active: true)
		devices.each do | dev | 

		   metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)

           metadatas.each do |m|
           	 page =	get_agent.get(m.detail)
           	 array = page.search('.priceGroup').children()
             price = array[3].text.delete('$')
             
             save_summary(@contract.id, @retailer.id,price,dev.id,m.detail)
      
           end
		end
	end
end