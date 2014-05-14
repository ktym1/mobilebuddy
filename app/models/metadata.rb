class Metadata < ActiveRecord::Base
	belongs_to :device
	belongs_to :retailer
end
