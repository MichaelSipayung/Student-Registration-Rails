class CreateSourceMotivationLists < ActiveRecord::Migration[7.1]
  def change
    create_table :source_motivation_lists do |t|
      t.string :motivasi

      t.timestamps
    end
  end
end
