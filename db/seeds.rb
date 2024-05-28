# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating users..."

user = User.create!(email: "aika@aika.com", password: "123456")

puts "Creating items..."

Item.create!(name: "trousers", brand: "COS", user: user)
Item.create!(name: "shirt", brand: "COS", user: user)

puts "Finished!"
