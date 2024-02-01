# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[7.1]
  def change
    create_table :sources do |t|
      t.integer :jumlah_n
      t.string :sumber_informasi
      t.string :motivasi

      t.timestamps
    end
  end
end
