class CreateAddressKecamatanLists < ActiveRecord::Migration[7.1]
  def change
    create_table :address_kecamatan_lists do |t|
      t.string :kecamatan

      t.timestamps
    end
  end
end
