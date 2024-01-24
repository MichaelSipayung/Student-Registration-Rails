class AddAddressKecamatanListRefToAddressKabupatenList < ActiveRecord::Migration[7.1]
  def change
    add_reference :address_kabupaten_lists, :address_kecamatan_list, null: false, foreign_key: true
  end
end
