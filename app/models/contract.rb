class Contract < ActiveRecord::Base
	has_many :summaries 
	has_many :retailers, through: :summaries
end
