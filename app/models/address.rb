class Address < ApplicationRecord
  belongs_to :user
  validates :alamat, presence: true, length: { minimum: 4, maximum: 30 }
  validates :kelurahan, presence: true, length: { minimum: 4, maximum: 30 }
  validates :kecamatan, presence: true, length: { minimum: 4, maximum: 30 }
  validates :kode_pos, presence: true, length: { minimum: 5, maximum: 5 }
  validates :provinsi, presence: true, length: { minimum: 4, maximum: 30 }
  validates :no_telepon, presence: true, length: { minimum: 10, maximum: 13 }
  validates :kabupaten, presence: true, length: { minimum: 4, maximum: 30 }
end
