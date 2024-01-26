class Parent < ApplicationRecord
  belongs_to :user
  validates :nama_ayah,:nama_ibu, presence: true, length: { minimum: 4, maximum: 25 }
  # validates :nama_ibu, presence: true, length: { minimum: 4, maximum: 25 }
  validates :nik_ayah,:nik_ibu, length: { minimum: 16, maximum: 16 },
            allow_nil: true
  # validates :nik_ibu, presence: true, length: { minimum: 16, maximum: 16 }
  validates :pendidikan_ayah, presence: true, length: { minimum: 2, maximum: 20 }
  validates :pendidikan_ibu, presence: true, length: { minimum: 2, maximum: 20 }
  validates :pekerjaan_ayah, presence: true, length: { minimum: 3, maximum: 20 }
  validates :pekerjaan_ibu, presence: true, length: { minimum: 3, maximum: 20 }
  validates :tanggal_lahir_ayah, :tanggal_lahir_ibu, presence: true, length: { minimum: 4, maximum: 20 }
  # validates :tanggal_lahir_ibu, presence: true, length: { minimum: 4, maximum: 20 }
end
