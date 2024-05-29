# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Cleaning database..."
Item.all.each {|item| item.photo.purge}
Item.destroy_all
User.destroy_all

puts "Creating users..."

user = User.create!(email: "test@test.com", password: "123456")

puts "Creating items..."

file = URI.open("./app/assets/images/dress1.jpg")
file_one = URI.open("./app/assets/images/dress2.jpg")
file_two = URI.open("./app/assets/images/suit1.jpg")
file_three = URI.open("./app/assets/images/suit2.jpg")

trouser = Item.new(name: "dress", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)
shirt = Item.new(name: "dress", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)
jacket = Item.new(name: "suit", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)
shoes = Item.new(name: "suit", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)

trouser.photo.attach(io: file, filename: "dress1.jpg", content_type: "image/jpg")
shirt.photo.attach(io: file_one, filename: "dress2.jpg", content_type: "image/jpg")
jacket.photo.attach(io: file_two, filename: "suit1.jpg", content_type: "image/jpg")
shoes.photo.attach(io: file_three, filename: "suit2.jpg", content_type: "image/jpg")

trouser.save!
shirt.save!
jacket.save!
shoes.save!

# file = URI.open("./app/assets/images/dress1.jpg")
# file_one = URI.open("./app/assets/images/dress2.jpg")
# file_two = URI.open("./app/assets/images/suit1.jpg")
# file_three = URI.open("./app/assets/images/suit2.jpg")

# trouser1 = Item.new(name: "dress", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)
# shirt1 = Item.new(name: "dress", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)
# jacket1 = Item.new(name: "suit", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)
# shoes1 = Item.new(name: "suit", brand: "COS", size: "M", price: "10", description: "Great piece of clothing, in immaculate state. Be the best dressed guest at your next event", user: user)

# trouser1.photo.attach(io: file, filename: "dress1.jpg", content_type: "image/jpg")
# shirt1.photo.attach(io: file_one, filename: "dress2.jpg", content_type: "image/jpg")
# jacket1.photo.attach(io: file_two, filename: "suit1.jpg", content_type: "image/jpg")
# shoes1.photo.attach(io: file_three, filename: "suit2.jpg", content_type: "image/jpg")

# trouser1.save!
# shirt1.save!
# jacket1.save!
# shoes1.save!

puts "Finished!"
