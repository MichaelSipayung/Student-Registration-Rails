# frozen_string_literal: true

class CreateMajors < ActiveRecord::Migration[7.1]
  def change
    create_table :majors do |t|
      t.string :jurusan1
      t.string :jurusan2
      t.string :jurusan3
      t.string :gelombang

      t.timestamps
    end
  end
end
