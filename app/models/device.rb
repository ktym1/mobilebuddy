class Device < ActiveRecord::Base
	has_many :summaries, dependent: :destroy
	has_many :retailers, through: :summaries
	has_many :metadatas, dependent: :destroy
	belongs_to :user

	mount_uploader :image, ImageUploader
	
	def self.active 
		where(active: true).order(:name)
	end

	def minimum_price
		price = Summary.where("created_at >= ? and device_id = ?", Date.today, self.id).minimum(:price)
		price.to_i
	end

	def display_name
		"#{name} #{model}"
	end

end
	