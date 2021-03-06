# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'admin@example.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true)

Category.create!(heading: 'Pizza',
                 description: "It's so good dough")

Category.create!(heading: 'Pasta',
                 description: "It's so good pasta")
Category.create!(heading: 'Dessert',
                 description: "It's so good ice cream")
10.times do |i|
  pizza = Product.new(
    name: 'Pizza',
    description: 'Lorem ipsum bbq chicken upstate newyork free range dough',
    price: 11.99,
    catering: true,
    category: Category.find(1)
  )
  pasta = Product.new(
    name: 'Pasta',
    description: 'Lorem ipsum bbq chicken upstate newyork free range dough',
    price: 8.99,
    catering: true,
    category: Category.find(2)
  )
  icecream = Product.new(
    name: 'Icecream',
    description: 'Lorem ipsum bbq chicken upstate newyork free range dough',
    price: 3.99,
    catering: true,
    category: Category.find(3)
  )
  pizza.image.attach(io: open('https://picsum.photos/1920/1080'), filename: "#{i}_image.jpg")
  pasta.image.attach(io: open('https://picsum.photos/1920/1080'), filename: "#{i}_image.jpg")
  icecream.image.attach(io: open('https://picsum.photos/1920/1080'), filename: "#{i}_image.jpg")
  if i == 5
    pizza.featured = true
    pasta.featured = true
    icecream.featured = true
  end
  pizza.save
  pasta.save
  icecream.save
end
