# model User : handle user
class User < ApplicationRecord
  #make sure when administrator delete user, it's also delete micropost
  has_many :microposts, dependent: :destroy #making relation user and microposts
  has_many :active_relationships, class_name: 'Relationship',
    foreign_key: 'follower_id', dependent: :destroy
  #using source to tell rails to look for followed_id in active_relationships table
  has_many :following, through: :active_relationships, source: :followed
  #follower: user.follower to go  with user.following
  has_many :passive_relationships, class_name: 'Relationship',
           foreign_key: 'followed_id', dependent: :destroy
  #using source to tell rails to look for follower_id in passive_relationships table
  has_many :followers, through: :passive_relationships, source: :follower
  #add destroy: since destroying a user should also destroy that user relationship, add dependent
  #example: @user.microposts.build(content: "lorem ipsum")
  #create accessible attribute for remember_token
  attr_accessor :remember_token, :activation_token, :reset_token #for storage in cookies and token-activation
  #transform the email to lowercase
  before_save {self.email = email.downcase}
  # assign an activation token and digest to each user
  # before user created, using before_create callback
  before_create :create_activation_digest
  has_one :personal, dependent: :destroy
  has_one :source, dependent: :destroy
  has_one :parent, dependent: :destroy
  has_one :major, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :extras, dependent: :destroy
  has_many :organizations, dependent: :destroy

  has_one :pmdk_each_score_information, dependent: :destroy
  has_one :pmdk_total_score_information, dependent: :destroy
  has_one :pmdk_school_information, dependent: :destroy

  has_one :utbk_score, dependent: :destroy
  has_one :utbk_school_information, dependent: :destroy
  has_one :usm_school_information
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
  #activates an account
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end
  #send activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  #set the password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  #Send password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  #define rule for expired link
  def password_reset_expired?
    reset_sent_at < 2.hours.ago  #make sure link is not exceed 2 hours to validated
  end
  def feed #define a proto-feed,
    Micropost.where("user_id = ?", id) #show post for current
    #logged in user, identify by it's id
    #question mark: ensure the id is properly escaped before included in sql query
  end
  def follow(other_user) #follow a user
    following <<  other_user
  end
  def unfollow(other_user)
    following.delete(other_user) #delete the records supplied from the collection
  end
  def following?(other_user) #true if the current user is following the other
    following.include?(other_user) #include? -> true if given record is present in the collections
  end
  private
  def create_activation_digest #assign activation token
    #create the token and digest
    self.activation_token = User.new_token #request new token
    self.activation_digest  = User.digest(activation_token) #hashed the token
  end
end
