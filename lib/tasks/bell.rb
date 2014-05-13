require_relative 'scraper'

class Bell < Scraper

	def initialize
	    @retailer = Retailer.where(name: 'Test')
	    @contract = Contract.where(name: 'Bell')
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

			promotion_link = page.links_with(:dom_class => "headingType4")[0].text

			new_page = page.links_with(:dom_class => "headingType4")[0].click()
			description = new_page.at('#mainDescription').text.delete('')
			array = new_page.search('.priceGroup').children()
            price = array[3].text.delete('$')


			# Summary.create(price: price, 
			# 	           contract_id: @contract.id, 
			# 	           device_id: dev.id,
			# 	           retailer_id: @retailer.id,
			# 	           promotion_link: promotion_link 
			# 	           )
			# price = array[3].text.delete('$')
			# puts "array length "+array.length.to_s
			# puts "0 "+array[0].text
			# puts "1 "+array[1].text
			# puts "2 "+array[2].text
			# puts "3 "+array[3].text
			# puts "4 "+array[4].text
			# puts "5 "+array[5].text
			# puts "6 "+array[6].text
			# puts "7 "+array[7].text
		end


	end
end