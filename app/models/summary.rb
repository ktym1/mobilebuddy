class Summary < ActiveRecord::Base
	belongs_to :contract
	belongs_to :device
	belongs_to :retailer

	validates :contract, presence: true
	validates :device, presence: true
	validates :retailer, presence: true

	def self.current(day, device_id)  
      where("created_at >= ? and device_id = ?", day, device_id)  
    end 

	def has_gift_card?
		result = self.gift_card
		result.nil? ? self.gift_card = "None." : result
	end
	
end
