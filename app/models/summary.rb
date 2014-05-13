class Summary < ActiveRecord::Base
	belongs_to :contract
	belongs_to :device
	belongs_to :retailer

	validates :contract, presence: true
end
