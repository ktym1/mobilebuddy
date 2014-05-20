class Device < ActiveRecord::Base
	has_many :summaries
	has_many :retailers, through: :summaries

	mount_uploader :image, ImageUploader
	
	def minimum_price
		price = Summary.where(device_id: self.id, created_at: (Time.now-5.day)..Time.now).minimum(:price)
		price
	end

end
	