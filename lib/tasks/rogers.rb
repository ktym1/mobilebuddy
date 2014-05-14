require_relative "scraper"

class Rogers < Scraper

	def initialize 
		@retailer = Retailer.where(name: "Test")
		@contract = Contract.find_by_name("Rogers")
	end

	def run
		devices = Device.all
		devices.each do |dev| 

			page = get_agent.get("http://www.rogers.com/web/Rogers.portal", {
				:_nfpb => "true",
				:_pageLabel => "search",
				:Ntt => "{dev.name}+{dev.model}+16gb" 
				})

			puts page.body

			# promotion_link = page.links_with(:dom_class => "search_result")[0].click()
			# new_page = page.links_with(:dom_class => "search_result")[0].click()
			# puts new_page
		end
	end
end

# /web/Rogers.portal?_nfpb=true&_pageLabel=search