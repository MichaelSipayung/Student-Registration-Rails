class CreateCostLists < ActiveRecord::Migration[7.1]
  def change
    create_table :cost_lists do |t|
      t.integer :biaya

      t.timestamps
    end
  end
end
