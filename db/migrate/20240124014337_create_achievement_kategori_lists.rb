class CreateAchievementKategoriLists < ActiveRecord::Migration[7.1]
  def change
    create_table :achievement_kategori_lists do |t|
      t.string :kategori

      t.timestamps
    end
  end
end
