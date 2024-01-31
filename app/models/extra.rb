# frozen_string_literal: true

# extra model : handle extra
class Extra < ApplicationRecord
  belongs_to :user
  validates  :nama_kegiatan, length: { minimum: 4, maximum: 20 }
  validates :predikat, length: { minimum: 4, maximum: 20 }
  validates :mulai, length: { minimum: 4, maximum: 20 }
  validates :berakhir, length: { minimum: 4, maximum: 20 }
end
