class CreateAchievementTingkatLists < ActiveRecord::Migration[7.1]
  def change
    create_table :achievement_tingkat_lists do |t|
      t.string :tingkat

      t.timestamps
    end
  end
end
