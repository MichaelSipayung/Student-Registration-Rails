class User < ApplicationRecord
  #transform the email to lowercase
  before_save {self.email = email.downcase}
  #validates the user input
  validates(:name, presence: true)
  validates(:name, length: {maximum: 50})
  validates(:email, presence: true)
  validates(:email, length: {maximum: 100})
  #email validation using regex
  validates(:email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i})
  validates(:email, uniqueness: true)
  validates :email, uniqueness: { case_sensitive: false }
  #has_secure_password : generate 2 virtual attributes (password and password_confirmation),
  # require the presence of the password, require that they match, add an
  # authenticate method to compare encrypted password to password_digest to authenticate users
  has_secure_password
  #adding rule for password
  validates(:password, presence: true)
  validates(:password, length: {minimum: 6})
end
