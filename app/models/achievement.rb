class Achievement < ApplicationRecord
  belongs_to :user
  validates :nama_prestasi, length: { minimum: 4, maximum: 30 }
  validates :tingkat, length: { minimum: 4, maximum: 20 }
  validates :tahun, length: { minimum: 4, maximum: 20 }
  validates :kategori, length: { minimum: 4, maximum: 20 }
end
