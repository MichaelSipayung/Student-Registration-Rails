class User < ApplicationRecord
  #create accessible attribute for remember_token
  attr_accessor :remember_token #for storage in cookies
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
  #return the hash digest of the given string
  def User.digest(string)
    #cost : the cost of hashing
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    #return the hash digest
    BCrypt::Password.create(string, cost: cost)
  end
  #return a random token, as a class method, since we need not use User object
  def User.new_token #like static variable
    SecureRandom.urlsafe_base64
  end
  #remember: function for dealing with remember stored token
  def remember
    self.remember_token = User.new_token
    #update attribute :remember_digest with new value :remember_token
    #and save the record to storage
    update_attribute :remember_digest, User.digest(remember_token)
  end
  #authenticated? : return true if the given token matches the digest
  def authenticated?(remember_token)
    #compare remember_digest with remember_token
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  #forget : forget a user, since there is no way to delete the cookies
  def forget
    update_attribute(:remember_digest, nil)
  end
end
