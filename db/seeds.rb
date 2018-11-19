# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = {}
user['password'] = '112233'
# user['password_confirmation'] = '112233'

ActiveRecord::Base.transaction do
  80.times do
  	user['name']  = Faker::Name.name
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['birthday'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end 

listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  50.times do 
    listing['room_type'] = ["Entire place", "Private room", "Shared room"].sample
    listing['house_type']= ["Vila","Hotel","Apartment","Home"].sample
    listing['guest'] = rand(1..16)
    listing['location'] = Faker::Address.city
    listing['rating'] = rand(3...6)
    # listing.images << Rails.root.join("app/assets/images/#{airbnb1.jpg}").open
    listing['user_id'] = uids.sample
    listing['price'] = rand(80..500)
    listing['images'] = [
        Rails.root.join("app/assets/images/listing_image_samples/#{['airbnb1.jpg','airbnb2.jpg','airbnb3.jpeg','airbnb4.jpg','airbnb4.jpeg','airbnb5.jpeg','airbnb6.jpeg','airbnb7.jpeg','airbnb8.jpeg','airbnb9.jpeg','airbnb10.jpeg','airbnb11.jpeg','airbnb12.jpeg','airbnb13.jpeg','airbnb14.jpeg','airbnb15.jpeg','airbnb17.jpeg','airbnb18.jpeg','airbnb19.jpeg','airbnb21.jpeg','airbnb22.jpeg','airbnb23.jpeg','airbnb24.jpeg','airbnb25.jpeg','airbnb26.jpeg','airbnb27.jpeg'].sample}").open, 
        Rails.root.join("app/assets/images/listing_image_samples/#{['airbnb1.jpg','airbnb2.jpg','airbnb3.jpeg','airbnb4.jpg','airbnb4.jpeg','airbnb5.jpeg','airbnb6.jpeg','airbnb7.jpeg','airbnb8.jpeg','airbnb9.jpeg','airbnb10.jpeg','airbnb11.jpeg','airbnb12.jpeg','airbnb13.jpeg','airbnb14.jpeg','airbnb15.jpeg','airbnb17.jpeg','airbnb18.jpeg','airbnb19.jpeg','airbnb21.jpeg','airbnb22.jpeg','airbnb23.jpeg','airbnb24.jpeg','airbnb25.jpeg','airbnb26.jpeg','airbnb27.jpeg'].sample}").open
      ]

    Listing.create(listing)
  end
end

