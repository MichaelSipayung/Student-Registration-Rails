class CreateCosts < ActiveRecord::Migration[7.1]
  def change
    create_table :costs do |t|
      t.integer :biaya
      t.integer :virtual_account
      t.string :voucher
      t.integer :total_bayar
      t.boolean :status_pembayaran

      t.timestamps
    end
  end
end
