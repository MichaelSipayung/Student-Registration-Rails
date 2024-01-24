class AddressKabupatenList < ApplicationRecord
  belongs_to :address_kecamatan_list
  validates :kabupaten, presence: true, uniqueness: true,
            length: { minimum: 3, maximum: 35 }
  validates :address_kecamatan_list_id, presence: true
end
