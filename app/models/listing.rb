class Listing < ApplicationRecord
	belongs_to :user
	mount_uploaders :images, ImageUploader
	

	scope :location, -> (location) { where("location like ?", "#{location}%")}
	scope :room_type, -> (room_type) { where room_type: room_type}
	scope :guest, -> (guest) { where guest: guest}

	

	def self.search_location(query)
		where('location ILIKE :location', location: "%#{query}%").map do |record|
			record.location
		end
	end
end

