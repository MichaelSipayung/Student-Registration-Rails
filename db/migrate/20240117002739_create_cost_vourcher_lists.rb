# frozen_string_literal: true

class CreateCostVourcherLists < ActiveRecord::Migration[7.1]
  def change
    create_table :cost_vourcher_lists do |t|
      t.string :voucher

      t.timestamps
    end
  end
end
