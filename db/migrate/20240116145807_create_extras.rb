class CreateExtras < ActiveRecord::Migration[7.1]
  def change
    create_table :extras do |t|
      t.string :nama_kegiatan
      t.date :mulai
      t.date :berakhir
      t.string :predikat

      t.timestamps
    end
  end
end
