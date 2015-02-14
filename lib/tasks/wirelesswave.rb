require_relative 'scraper'
class WirelessWave < Scraper

	def initialize
	    @retailer = get_retailer('Wireless Wave')
	    @contract = "" 
	end

  #loop through summaries and save to db
	def run
    get_summary.each do |s|
      save_summary(s[:contract_id], s[:retailer_id], s[:price], s[:device_id], s[:promotion_link], s[:gift_card])
      binding.pry
    end
  end

  #go to wave pages, get device info, and save into an array
  def get_summary
    summary = []
    get_pages.each do |p|
      summary_attr = {}
      summary_attr[:price] = get_price(p)
      summary_attr[:gift_card] = get_gift_card(p)
      summary_attr[:retailer_id] = @retailer.id
      summary_attr[:contract_id] = get_carrier(p.title)
      summary_attr[:device_id] = get_device(p.uri)
      summary_attr[:promotion_link] = get_promotion_link(p.uri)
  
      summary << summary_attr
    end
      return summary     
  end

  def active_devices
    Device.where(active:true)
  end

  #get the page_links for devices and save to an array
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

  def get_gift_card(page)
    if page.at(".phoneDetail-hotOffer").nil?
      puts "No GC"
    else
      page.at(".phoneDetail-hotOffer").text
    end
  end

  #Brittle since it depends on page title
  def get_carrier(title)
    if title.include?("Bell")
      @contract = get_contract('Bell')
      contract_id = @contract.id
    end
  end
  
  def get_device(url)
    metadatas = Metadata.where(retailer_id: @retailer.id)
    metadatas.each do |m|
      if url.to_s.include?(m.detail)
        return m.device_id
      end
    end
  end

  def get_promotion_link(url)
    return url.to_s
  end

end