class CreateAddressProvinceLists < ActiveRecord::Migration[7.1]
  def change
    create_table :address_province_lists do |t|
      t.string :provinsi

      t.timestamps
    end
  end
end
