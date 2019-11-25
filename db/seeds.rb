# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Cart.destroy_all
Item.destroy_all
Order.destroy_all
u = [] #tableau User
i = [] #Tableau Item
c = [] #tableau Cart

5.times do
u << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Name.first_name + "@yopmail.com", password: "fauxuser")
puts "User : #{Faker::Name.first_name}"
end

40.times do
i << Item.create(title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 20), price: rand(1..100)+","+rand(1..9)+rand(1..9), image: "https://static.wamiz.fr/images/articles/facebook/article/chaton-jouets-fb-59a3ea83c1a7d.jpg")
puts "Item: #{Faker::Book.title}"
end

5.times do
c << Cart.create(user_id: u.sample)
end
puts "Cart create"

20.times do
  ItemCart.create(cart_id: c.sample, item_id: i.sample)
end
puts "ItemCart create"

clength = c.length
clength.times do |index|
Order.create(cart_id: c[index])
end
puts "Order Create"
