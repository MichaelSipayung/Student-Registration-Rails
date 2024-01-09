class User < ApplicationRecord
  #create accessible attribute for remember_token
  attr_accessor :remember_token, :activation_token #for storage in cookies and token-activation
  #transform the email to lowercase
  before_save {self.email = email.downcase}
  # assign an activation token and digest to each user
  # before user created, using before_create callback
  before_create :create_activation_digest
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
  def authenticated?(attribute,token) #generalize version of authenticated
    #using send: metaprogramming, we need for activation phases
    digest  = send("#{attribute}_digest") #using str interpolation
    #compare remember_digest with remember_token
    return false if digest.nil? #make it not authenticated if in
    #one browser already logout but in the other browser still login
    BCrypt::Password.new(digest).is_password?(token)
  end
  #forget : forget a user, since there is no way to delete the cookies
  def forget
    update_attribute(:remember_digest, nil)
  end
  private
  def create_activation_digest #assign activation token
    #create the token and digest
    self.activation_token = User.new_token #request new token
    self.activation_digest  = User.digest(activation_token) #hashed the token
  end
end
