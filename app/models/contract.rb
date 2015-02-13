class Contract < ActiveRecord::Base
	has_many :summaries, dependent: :destroy
	has_many :retailers, through: :summaries
end
