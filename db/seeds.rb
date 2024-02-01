# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# generate a bunch of additional users
99.times do |n|
  name = Faker::Name.name
  email = "exampleother-#{n + 1}@rails.org"
  password = 'password'
  User.create!(name:, email:, password:,
               password_confirmation: password, activated: true, activated_at: Time.zone.now)
end
User.create!(name: 'admin',
             email: 'admin@gmail.com',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
# generate micropost for a subset of users
users = User.order(:created_at).take(6) # limit only for 6 users
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  # each user will contain 50 posts
  users.each { |user| user.microposts.create!(content:) }
end
# generate following relationship
users = User.all
user = users.first
following = users[2..50] # follow users 2 to 50
followers = users[3..49] # followers users 3 to 49
following.each { |followed| user.follow(followed) } # follow each user
followers.each { |follower| follower.follow(user) } # each user follow user
