# frozen_string_literal: true

class Personal < ApplicationRecord
  belongs_to :user
  validates :nama_lengkap, presence: true, length: { minimum: 4, maximum: 25 }
  validates :agama, presence: true, length: { minimum: 4, maximum: 20 }
  validates :jenis_kelamin, presence: true, length: { minimum: 4, maximum: 20 }
  validates :tempat_lahir, presence: true, length: { minimum: 4, maximum: 20 }
  validates :tanggal_lahir, presence: true, length: { minimum: 4, maximum: 20 }
  validates :nik, presence: true, length: { minimum: 16, maximum: 16 }
  validates :nisn, presence: true, length: { minimum: 10, maximum: 10 }
  validates :no_kps, length: { minimum: 6, maximum: 6 }, allow_nil: true
  validates :domisili, presence: true, length: { minimum: 4, maximum: 30 }
  has_one_attached :pas_photo
  validates :pas_photo, content_type: %i[jpg png jpeg], size: { less_than: 1.megabytes }
end
