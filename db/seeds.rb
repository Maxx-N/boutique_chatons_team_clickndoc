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
ItemCart.destroy_all
Order.destroy_all
ItemOrder.destroy_all
u = [] #tableau User et cart
i = [] #Tableau Item
o = [] #tableau Order

1.times do
  User.create(first_name: "Staff", last_name: "Chaton", email: "staff-chaton@yopmail.com", password: "administrator", admin: true)
end

5.times do |index|
u << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Name.first_name + "@yopmail.com", password: "fauxuser")
puts "User : #{Faker::Name.first_name}, cart create"
sleep(rand(2..5))
end

def round(number,precision=2)
  ("%01.#{precision}f" %number).to_f
end

cc = 1
51.times do
img_cat = "c#{cc}.jpg" #images aléatoires
cc = cc + 1 #images aléatoires
i << Item.create(title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 30), price: round(rand(1.00..100.99)), image_url: img_cat)
puts "Item: #{Faker::Book.title}"
end

20.times do
  ItemCart.create(cart_id: u.sample.id, item_id: i.sample.id)
end
puts "ItemCart create"


20.times do |index|
o << Order.create(cart_id: u.sample.id)
end
puts "Order Create"

20.times do
  ItemOrder.create(order_id: o.sample.id, item_id: i.sample.id)
end
puts "ItemOrder create"
