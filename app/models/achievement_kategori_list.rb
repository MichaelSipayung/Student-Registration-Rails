# frozen_string_literal: true

# achievements kategori list model
class AchievementKategoriList < ApplicationRecord
  validates :kategori, presence: true, length: { minimum: 4, maximum: 15 }, uniqueness: true
end
