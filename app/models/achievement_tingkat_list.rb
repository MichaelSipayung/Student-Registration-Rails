# achievement_tingkat_list model : handle achievement_tingkat_list
class AchievementTingkatList < ApplicationRecord
  validates :tingkat, presence: true, length: {minimum: 4, maximum: 15}, uniqueness: true
end
