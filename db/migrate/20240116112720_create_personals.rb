# frozen_string_literal: true

class CreatePersonals < ActiveRecord::Migration[7.1]
  def change
    create_table :personals do |t|
      t.string :nama_lengkap
      t.string :agama
      t.integer :nik
      t.integer :nisn
      t.integer :no_kps
      t.date :tanggal_lahir
      t.string :tempat_lahir
      t.string :jenis_kelamin
      t.string :domisili
      t.string :whatsapp

      t.timestamps
    end
  end
end
