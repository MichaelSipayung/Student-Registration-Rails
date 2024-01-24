class CreateBatchLists < ActiveRecord::Migration[7.1]
  def change
    create_table :batch_lists do |t|
      t.string :gelombang
      t.boolean :aktif

      t.timestamps
    end
  end
end
