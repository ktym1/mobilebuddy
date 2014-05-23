class Summary < ActiveRecord::Base
	belongs_to :contract
	belongs_to :device
	belongs_to :retailer

	validates :contract, presence: true
	validates :device, presence: true
	validates :retailer, presence: true


	# def carrier
	# 	carrier = ""
	# 	if self.retailer.name == self.contract.name
 #           carrier = self.retailer.name
 #        else
 #           carrier = self.contract.name
 #        end
 #        carrier
	# end


	# def self.search(query)
 #  		Summary.joins(:device).where("name like ?", "%#{query}%") 
	# end
	
end
