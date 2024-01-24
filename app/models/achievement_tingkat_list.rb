class AchievementTingkatList < ApplicationRecord
  validates :tingkat, presence: true, length: {minimum: 4, maximum: 15}, uniqueness: true
end
