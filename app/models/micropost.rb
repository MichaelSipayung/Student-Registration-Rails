# frozen_string_literal: true

# micropost model : handle micropost
class Micropost < ApplicationRecord
  belongs_to :user # user_id
  # change the behavior, make the last inserted post come first
  default_scope -> { order(created_at: :desc) } # using lambda function ->
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  # associated an upload file with micropost model
  has_one_attached  :image # using active storage api
  validates :image, content_type: %i[png jpg jpeg], size: { less_than: 1.megabytes }
end
