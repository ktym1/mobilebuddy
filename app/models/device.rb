class Device < ActiveRecord::Base
	has_many :summaries
	has_many :retailers, through: :summaries
	belongs_to :user

	mount_uploader :image, ImageUploader
	
	def self.active 
		where(active: true)
	end

	def minimum_price
		price = Summary.where("created_at >= ? and device_id = ?", Date.today, self.id).minimum(:price)
		price
	end

	def display_name
		"#{name} #{model}"
	end

end
	