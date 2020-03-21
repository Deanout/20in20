# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  username: 'Deanin',
  email: 'dean@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

10.times do |_i|
  User.create!(username: Faker::Name.unique.first_name,
               email: Faker::Internet.unique.email,
               password: 'password',
               password_confirmation: 'password',
               admin: false)
end

pseudo_rng = Random.new

5.times do |i|
  post = Post.new
  post.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
  post.body = Faker::Lorem.paragraph_by_chars(number: 1500)
  post.user = User.first
  post.thumbnail.attach(io: URI.open('https://picsum.photos/1920/1080'), filename: "#{i}_thumbnail.jpg")
  post.banner.attach(io: URI.open('https://picsum.photos/1920/1080'), filename: "#{i}_banner.jpg")
  post.views = Faker::Number.between(from: 1, to: 5000)
  post.save
  # User ids start with a value of 1.
  # In order to pass a valid user id, value must be > 1.
  # In order to avoid our user having comments, value must
  # be > 2. Hence we use (2 + rnd_num) instead of (1 + rnd_num).
  (2 + pseudo_rng.rand(8)).times do |_j|
    comment = post.comments.build(body: Faker::Lorem.paragraph_by_chars(number: 500),
                                  user: User.find(2 + pseudo_rng.rand(10)))
    comment.save
    pseudo_rng.rand(5).times do |_k|
      nested_comment = comment.comments.build(body: Faker::Lorem.paragraph_by_chars(number: 500),
                                              user: User.find(2 + pseudo_rng.rand(10)),
                                              reply: true)
      nested_comment.save
    end
  end
end
