class Micropost < ApplicationRecord
  belongs_to :user
  #change the behavior, make the last inserted post come first
  default_scope -> {order(created_at: :desc)} #using lambda function ->
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
