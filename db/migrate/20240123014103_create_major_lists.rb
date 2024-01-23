class CreateMajorLists < ActiveRecord::Migration[7.1]
  def change
    create_table :major_lists do |t|
      t.string :jurusan

      t.timestamps
    end
  end
end
