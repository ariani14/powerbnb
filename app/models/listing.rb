class Listing < ApplicationRecord
	belongs_to 	:user
	has_many 	:payments
	has_many 	:reservations
	mount_uploaders :images, ImageUploader
	include PgSearch
	pg_search_scope :search_by_location, :against => :location
	

	scope :location, -> (location) { where("location like ?", "#{location}%")}
	scope :room_type, -> (room_type) { where room_type: room_type}
	scope :guest, -> (guest) { where guest: guest}

	

	def self.search_location(query)
		where('location ILIKE :location', location: "%#{query}%").map do |record|
			record.location
		end
	end
end

