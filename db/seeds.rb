# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
def destroy_seed
  User.destroy_all
  Cart.destroy_all
  Item.destroy_all
  ItemCart.destroy_all
  Tag.destroy_all
  ItemTag.destroy_all
  Order.destroy_all
  ItemOrder.destroy_all
  puts "destroy"
end
def create_seed
  u = [] #tableau User et cart
  i = [] #Tableau Item
  o = [] #tableau Order
  t1 = [] #tableau Tag age du chat
  t2 = [] #tableau Tag couleur du chat
  t3 = [] #tableau Tag race de chat
  #compte admin
  1.times do
    User.create(first_name: "Staff", last_name: "Chaton", email: "staff-chaton@yopmail.com", password: "administrator", admin: true)
  end
  #comptes faker user
  5.times do |index|
  u << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Name.first_name + "@yopmail.com", password: "fauxuser")
  puts "User : #{Faker::Name.first_name}, cart create"
  end
  #items : photos de chats
  def round(number,precision=2)
    ("%01.#{precision}f" %number).to_f
  end
  cc = 1
  51.times do
  img_cat = "https://kitten-pics-shop.s3.eu-west-3.amazonaws.com/c#{cc}.jpg" #image de chat
  cc = cc + 1 #image de chat
  i << Item.create(title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 30), price: round(rand(1.00..100.99)), image_url: img_cat)
  puts "Item: #{Faker::Book.title}"
  end
  #tags
  t1 << Tag.create(name: "Chaton")
  t1 << Tag.create(name: "Chat adulte")
  t2 << Tag.create(name: "Roux")
  t2 << Tag.create(name: "Blanc")
  t2 << Tag.create(name: "Gris")
  t2 << Tag.create(name: "Noir")
  t2 << Tag.create(name: "Rayé")
  t2 << Tag.create(name: "Tricolore")
  t2 << Tag.create(name: "Fauve")
  t3 << Tag.create(name: "Européen")
  t3 << Tag.create(name: "Angora")
  t3 << Tag.create(name: "Main Coon")
  t3 << Tag.create(name: "Siamois")
  t3 << Tag.create(name: "Savannah")
  t3 << Tag.create(name: "Munchkin")
  t3 << Tag.create(name: "Bengal")
  puts "Tags create"
  all_cats = Item.all
  all_cats.each do |cat|
    ItemTag.create(item_id: cat.id, tag_id: t1.sample.id)
    ItemTag.create(item_id: cat.id, tag_id: t2.sample.id)
    ItemTag.create(item_id: cat.id, tag_id: t3.sample.id)
  end
  20.times do
    ItemTag.create(item_id: i.sample.id, tag_id: t2.sample.id)
  end
  puts "ItemTag create"
  #différentes tables de liaisons
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
end
destroy_seed
create_seed

