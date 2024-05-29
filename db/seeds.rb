# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Item.destroy_all
User.destroy_all

puts "Creating users..."

user = User.create!(email: "test@test.com", password: "123456")

puts "Creating items..."

Item.create!(name: "trousers", brand: "COS", size: "M", price: "10", user: user)
Item.create!(name: "shirt", brand: "COS", size: "M", price: "10", user: user)

puts "Finished!"
