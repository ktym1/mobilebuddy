class Retailer < ActiveRecord::Base
	has_many :summaries
	has_many :contracts , :through => :summaries
	has_many :devices , :through => :summaries

end
