# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :alamat
      t.string :kelurahan
      t.string :kecamatan
      t.integer :kode_pos
      t.string :provinsi
      t.integer :no_telepon
      t.string :kabupaten

      t.timestamps
    end
  end
end
