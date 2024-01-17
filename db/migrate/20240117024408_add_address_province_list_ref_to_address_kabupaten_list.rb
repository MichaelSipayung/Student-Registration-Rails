class AddAddressProvinceListRefToAddressKabupatenList < ActiveRecord::Migration[7.1]
  def change
    add_reference :address_kabupaten_lists, :address_province_list, null: false, foreign_key: true
  end
end
