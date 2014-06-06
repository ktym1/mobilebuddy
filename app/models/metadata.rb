class Metadata < ActiveRecord::Base
	belongs_to :device
	belongs_to :retailer

	validates :device, presence: true
	validates :retailer, presence: true
end
