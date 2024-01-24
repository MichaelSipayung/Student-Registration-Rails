class AddressProvinceList < ApplicationRecord
  has_many :address_kabupaten_lists, dependent: :destroy
  validates :provinsi, presence: true, uniqueness: true,
            length: { minimum: 3, maximum: 35 }
end
