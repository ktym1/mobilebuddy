require_relative 'scraper'
class WirelessWave < Scraper

	def initialize
	    @retailer = get_retailer('Wireless Wave')
	    @contract = "" 
	end

	def run
    summaries = []
		get_pages.each do |p|
      device_summary = {}
      device_summary[:price] = get_price(p)
      device_summary[:gift_card] = get_gift_card(p)
      device_summary[:retailer_id] = @retailer.id
      device_summary[:contract_id] = get_carrier(p.title)


    end
            
 #         price = get_price(page)
 #       	 get_carrier(m.detail)
 #       	 gift_card =  get_gift_card(page)
 #         save_summary(@contract.id, @retailer.id, price, dev.id, m.detail, gift_card)
    
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

#Brittle since it depends on page title
  def get_carrier(title)
    if title.include?("Bell")
      @contract = get_contract('Bell')
      contract_id = @contract.id
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