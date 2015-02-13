require_relative 'scraper'
class WirelessWave < Scraper

	def initialize
	    @retailer = get_retailer('Wireless Wave')
	    @contract = "" 
	end

	def run
		get_pages.each do |p|
        
    end
        
        
        
 #         price = get_price(page)
 #       	 get_carrier(m.detail)
 #       	 gift_card =  get_gift_card(page)
 #         save_summary(@contract.id, @retailer.id, price, dev.id, m.detail, gift_card)
      # end
		# end
	end

  def active_devices
    Device.where(active:true)
  end

  def get_pages
    page_array = []
    active_devices.each do |dev|
      metadatas =  Metadata.where(retailer_id: @retailer.id, device_id: dev.id)
      metadatas.each do |m|
        page = get_agent.get(m.detail)
        page_array << page
      end
    end
    return page_array
  end

  def get_price(page)
    raw = page.at(".phoneDetail-price")
    char_array = raw.text.split(//)
    price_elements = char_array[2..4]
    price_elements.join.to_i
  end

	def get_carrier(contract_name)
		if(contract_name.include? "bell")
			@contract = get_contract('Bell')
		end	
	end

  def get_gift_card(page)
    if page.at(".phoneDetail-hotOffer").nil?
      puts "-"
    else
      page.at(".phoneDetail-hotOffer").text
    end
  end


end