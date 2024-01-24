class AddressKecamatanList < ApplicationRecord
  has_many :address_kabupaten_lists, dependent: :destroy
  belongs_to :address_province_list
  validates :kecamatan, presence: true, uniqueness: true,
            length: { minimum: 3, maximum: 35 }
  validates :address_province_list_id, presence: true
end
