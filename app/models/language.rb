class Language < ApplicationRecord
  belongs_to :user
  validates :nama_bahasa, presence: true, length: { minimum: 4, maximum: 20 }
  validates :tingkat, presence: true, length: { minimum: 4, maximum: 20 }
end
