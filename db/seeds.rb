require "open-uri"

puts "Cleaning database..."
Rental.destroy_all

Item.all.each { |item| item.photo.purge }
Item.destroy_all
User.destroy_all

puts "Creating users..."

users = [
  { username: 'fashionista1', email: 'fashionista1@example.com', password: 'password123' },
  { username: 'stylishguy', email: 'stylishguy@example.com', password: 'password123' },
  { username: 'trendsetter', email: 'trendsetter@example.com', password: 'password123' },
  { username: 'chicdiva', email: 'chicdiva@example.com', password: 'password123' },
  { username: 'elegantlady', email: 'elegantlady@example.com', password: 'password123' },
  { username: 'dapperdude', email: 'dapperdude@example.com', password: 'password123' },
  { username: 'modmaven', email: 'modmaven@example.com', password: 'password123' },
  { username: 'styleicon', email: 'styleicon@example.com', password: 'password123' },
  { username: 'classygal', email: 'classygal@example.com', password: 'password123' },
  { username: 'sharpdressed', email: 'sharpdressed@example.com', password: 'password123' }
]

users.each do |user|
  User.create!(user)
end

puts "Creating items..."

clothing_items = [
  { name: 'Red Evening Gown', brand: 'Gucci', size: 'M', price: 9, description: 'A stunning red evening gown perfect for formal occasions. Crafted from luxurious silk, it features intricate beading and a flattering silhouette that will make you the star of the evening.', image_url: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=2883&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user: User.all.sample },
  { name: 'Black Tuxedo', brand: 'Armani', size: 'L', price: 10, description: 'A sleek black tuxedo for the modern gentleman. This timeless piece is tailored to perfection, ensuring you look sharp and sophisticated at any event.', image_url: 'https://images.unsplash.com/photo-1592878897400-43fb1f1cc324?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user: User.all.sample },
  { name: 'Floral Summer Dress', brand: 'Dolce & Gabbana', size: 'S', price: 8, description: 'A light and breezy floral dress, ideal for summer outings. The vibrant floral pattern and lightweight fabric make it perfect for warm weather and outdoor parties.', image_url: 'https://images.unsplash.com/photo-1562904403-59290a1e0049?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user: User.all.sample },
  { name: 'Blue Cocktail Dress', brand: 'Versace', size: 'S', price: 7, description: 'A chic blue cocktail dress perfect for evening events. Its elegant design and comfortable fit make it a versatile choice for any special occasion.', image_url: 'https://images.unsplash.com/photo-1622079402559-8b9a7fad367c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ymx1ZSUyMGRyZXNzfGVufDB8fDB8fHww', user: User.all.sample },
  { name: 'Grey Business Suit', brand: 'Hugo Boss', size: 'M', price: 10, description: 'A professional grey business suit for corporate meetings. This suit exudes confidence and style, making it ideal for important business engagements.', image_url: 'https://plus.unsplash.com/premium_photo-1661658467520-214557801af3?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user: User.all.sample },
  { name: 'Pink Party Dress', brand: 'Valentino', size: 'XS', price: 6, description: 'A vibrant pink dress perfect for parties and celebrations. The playful design and bold color will ensure you stand out at any event.', image_url: 'https://images.unsplash.com/photo-1473286835901-04adb1afab03?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user: User.all.sample },
  { name: 'White Wedding Gown', brand: 'Vera Wang', size: 'L', price: 10, description: 'A beautiful white wedding gown for your special day. With its intricate lace detailing and flowing skirt, this gown will make your wedding unforgettable.', image_url: 'https://images.unsplash.com/flagged/photo-1578317767641-c2a23b16b814?q=80&w=2911&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user: User.all.sample },
  { name: 'Green Jumpsuit', brand: 'Prada', size: 'M', price: 9, description: 'A trendy green jumpsuit for casual and semi-formal occasions. This versatile piece can be dressed up or down, making it a great addition to any wardrobe.', image_url: 'https://images.unsplash.com/photo-1568252748074-f9c8d964e834?q=80&w=2804&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user: User.all.sample },
]

clothing_items.each do |item|
  clothing = Item.new(
    name: item[:name],
    brand: item[:brand],
    size: item[:size],
    price: item[:price],
    description: item[:description],
    user: item[:user]
  )
  clothing.photo.attach(io: URI.open(item[:image_url]), filename: "#{item[:name].parameterize}.jpg")
  clothing.save!
end

puts "Finished!"
