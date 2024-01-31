# frozen_string_literal: true

# model Relationship : handle relationship
class Relationship < ApplicationRecord
  # association of follower and followed
  belongs_to :follower, class_name: 'User' # follower_id
  belongs_to :followed, class_name: 'User' # followed_id
  validates :followed_id, presence: true
  validates :follower_id, presence: true
end
