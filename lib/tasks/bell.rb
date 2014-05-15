require_relative 'scraper'

class Bell < Scraper

	def initialize
	    @retailer = Retailer.where(name: 'Bell').take
	    @contract = Contract.find_by_name('Bell')
	end


	def run
		devices = Device.all
		devices.each do | dev |

			page =	get_agent.get('http://www.bell.ca/Search',{:q => "#{dev.name} #{dev.model}",
			                                   :lob =>'consumerBoost',
			                                   :support =>'false',
			                                   :faq => 'false',
			                                   :personal =>'on',
			                                   :initial =>'true',
			                                   :prov => 'ON'
			                                  })

			promotion_link = page.links_with(:dom_class => "headingType4")[0].uri()

			new_page = page.links_with(:dom_class => "headingType4")[0].click()


			description = new_page.at('#mainDescription').text.delete('')
		    array = new_page.search('.priceGroup').children()
            price = array[3].text.delete('$')
            
           

			Summary.create(price: price, 
				           contract_id: @contract.id, 
				           device_id: dev.id,
				           retailer_id: @retailer.id,
				           promotion_link: promotion_link.to_s 
				           )
		end
	end
end