# frozen_string_literal: true

# achievement model : handle achievement
class Achievement < ApplicationRecord
  belongs_to :user
  validates :nama_prestasi, presence: true, length: { minimum: 4, maximum: 30 }
  validates :tingkat, presence: true, length: { minimum: 4, maximum: 20 }
  validates :tahun, presence: true, length: { minimum: 4, maximum: 20 }
  validates :kategori, presence: true, length: { minimum: 4, maximum: 20 }
end
