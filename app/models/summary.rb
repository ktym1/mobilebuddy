class Summary < ActiveRecord::Base
	belongs_to :contract
	belongs_to :device
	belongs_to :retailer

	validates :contract, presence: true
	validates :device, presence: true
	validates :retailer, presence: true

	def has_gift_card?
		result = self.gift_card == nil
		if result
			self.gift_card = "Sorry, Chris! :( Maybe next time."
		end
		result
	end
	
end
