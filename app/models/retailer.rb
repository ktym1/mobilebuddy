class Retailer < ActiveRecord::Base
	has_many :summaries, dependent: :destroy
	has_many :contracts, :through => :summaries
	has_many :devices, :through => :summaries

end
