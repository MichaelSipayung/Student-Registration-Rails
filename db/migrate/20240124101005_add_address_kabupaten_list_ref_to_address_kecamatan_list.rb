# frozen_string_literal: true

class AddAddressKabupatenListRefToAddressKecamatanList < ActiveRecord::Migration[7.1]
  def change
    add_reference :address_kecamatan_lists, :address_kabupaten_list, null: false, foreign_key: true
  end
end
