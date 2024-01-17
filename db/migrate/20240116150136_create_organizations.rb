class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :nama_organisasi
      t.date :mulai
      t.date :berakhir
      t.string :jabatan

      t.timestamps
    end
  end
end
