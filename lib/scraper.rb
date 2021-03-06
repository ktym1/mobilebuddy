require 'mechanize'
require 'open-uri'
require 'watir-webdriver'
require 'logger'

class Scraper

	attr_reader :active_devices
	
	def initialize
		@active_devices = Device.where(active:true)
	end

	protected
		def get_agent
			agent_aliases = Mechanize::AGENT_ALIASES.to_a
			# agent_aliases[Random.rand(Mechanize::AGENT_ALIASES.length)][0]
			#setting a random user agent 		
			agent = Mechanize.new{ |agent| agent.user_agent_alias = 'Mac Safari' }
			agent.follow_meta_refresh_self
		    agent.redirect_ok
			agent.log = Logger.new('log/scraping.log')
		    agent
		end

		def save_summary(contract_id, retailer_id, price, dev_id, promotion_link, gift_card)
			begin 

				s =	Summary.create(	contract_id: contract_id, 
							           retailer_id: retailer_id,
							           price: price,
							           device_id: dev_id,
							           promotion_link: promotion_link.to_s,
							           gift_card: gift_card
							       )
				puts " Saved: #{s.device.name} #{s.device.model}"

			rescue => ex
	      puts ex.message 
			  puts ex.code
			end
		end

		def get_contract(name)
		    contract = nil
			begin
		    contract = Contract.find_by_name(name)
			rescue => ex
			    puts ex.message 
			    puts ex.code
			end
			contract
		end
		

		def get_retailer(name)
		  retailer = nil
			begin
		    retailer = Retailer.find_by_name(name)
			rescue => ex
				puts ex.message 
			  puts ex.code
			end
			retailer
		end
end
