class User < ApplicationRecord
  #validates the user input
  validates(:name, presence: true)
  validates(:name, length: {maximum: 50})
  validates(:email, presence: true)
  validates(:email, length: {maximum: 100})
  validates(:email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create})
end
