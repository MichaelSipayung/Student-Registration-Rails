class AddressKabupatenList < ApplicationRecord
  has_many :address_kecamatan_lists, dependent: :destroy
  validates :kabupaten, presence: true, uniqueness: true,
            length: { minimum: 3, maximum: 35 }
  validates :address_province_list_id, presence: true
end
