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

10.times do |i|
    Item.create!(
        name: "Pizza",
        description: "Pepperoni, Ham, Italian Sausage, Hamburger, Bacon, Green Pepper, Onion, Pineapple, Mushroom, Banana Pepper, Ground Beef, Black & Green Olives , Tomato",
        price: 11.99,
        catering_item: true,
    )
end