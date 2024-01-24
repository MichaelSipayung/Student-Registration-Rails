class CreateAddressKabupatenLists < ActiveRecord::Migration[7.1]
  def change
    create_table :address_kabupaten_lists do |t|
      t.string :kabupaten

      t.timestamps
    end
  end
end
