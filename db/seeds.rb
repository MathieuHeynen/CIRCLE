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
Item.destroy_all
User.destroy_all

puts "Creating users..."

user = User.create!(email: "test@test.com", password: "123456")

puts "Creating items..."

file = URI.open("https://plus.unsplash.com/premium_photo-1683143646131-92a439faca4d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
file_one = URI.open("https://plus.unsplash.com/premium_photo-1692441578418-88b76776791e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
file_two = URI.open("https://images.unsplash.com/photo-1493568000180-ca2fb70ddcba?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8amFja2V0fGVufDB8MHwwfHx8MA%3D%3D")
file_three = URI.open("https://plus.unsplash.com/premium_photo-1705554330163-2e0ccc1808e2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")

trouser = Item.new(name: "trousers", brand: "COS", size: "M", price: "10", user: user)
shirt = Item.new(name: "shirt", brand: "COS", size: "M", price: "10", user: user)
jacket = Item.new(name: "jacket", brand: "COS", size: "M", price: "10", user: user)
shoes = Item.new(name: "shoes", brand: "COS", size: "M", price: "10", user: user)

trouser.photo.attach(io: file, filename: "trousers.jpg", content_type: "image/jpg")
shirt.photo.attach(io: file_one, filename: "shirt.jpg", content_type: "image/jpg")
jacket.photo.attach(io: file_two, filename: "jacket.jpg", content_type: "image/jpg")
shoes.photo.attach(io: file_three, filename: "shoes.jpg", content_type: "image/jpg")

trouser.save!
shirt.save!
jacket.save!
shoes.save!

puts "Finished!"
