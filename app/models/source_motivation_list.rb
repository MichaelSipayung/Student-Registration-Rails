class SourceMotivationList < ApplicationRecord
  validates :motivasi, presence: true,  length: {minimum: 4, maximum: 20}, uniqueness: true
end
