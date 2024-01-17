class CreateExtraLists < ActiveRecord::Migration[7.1]
  def change
    create_table :extra_lists do |t|
      t.string :predikat

      t.timestamps
    end
  end
end
