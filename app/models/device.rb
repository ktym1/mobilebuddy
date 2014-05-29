class Device < ActiveRecord::Base
	has_many :summaries
	has_many :retailers, through: :summaries
	belongs_to :user

	mount_uploader :image, ImageUploader

	def minimum_price
		price = Summary.where(device_id: self.id, created_at: (Time.now-2.day)..Time.now).minimum(:price)
		price
	end

	def display_name
		"#{name} #{model}"
	end

end
	