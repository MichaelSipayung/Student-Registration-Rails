class RemoveAddressKecamatanListRefFromAddressKabupatenList < ActiveRecord::Migration[7.1]
  def change
    remove_reference :address_kabupaten_lists,
                     :address_kecamatan_list, index: true, foreign_key: true
  end
end
