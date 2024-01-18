class Organization < ApplicationRecord
  belongs_to :user
  validates :nama_organisasi, presence: true, length: { minimum: 4, maximum: 20 }
  validates :jabatan, presence: true, length: { minimum: 4, maximum: 20 }
  validates :mulai, presence: true, length: { minimum: 4, maximum: 20 }
  validates :berakhir, presence: true, length: { minimum: 4, maximum: 20 }
end
