# frozen_string_literal: true

# address_kecamatan_list model : handle address_kecamatan_list
class AddressKecamatanList < ApplicationRecord
  belongs_to :address_kabupaten_list
  validates :kecamatan, presence: true, uniqueness: true,
                        length: { minimum: 3, maximum: 35 }
  validates :address_kabupaten_list_id, presence: true
end
