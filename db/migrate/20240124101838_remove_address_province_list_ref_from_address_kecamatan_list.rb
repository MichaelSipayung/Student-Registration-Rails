# frozen_string_literal: true

class RemoveAddressProvinceListRefFromAddressKecamatanList < ActiveRecord::Migration[7.1]
  def change
    remove_reference :address_kecamatan_lists, :address_province_list, index: true, foreign_key: true
  end
end
