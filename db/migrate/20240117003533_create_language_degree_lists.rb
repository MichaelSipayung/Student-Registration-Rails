class CreateLanguageDegreeLists < ActiveRecord::Migration[7.1]
  def change
    create_table :language_degree_lists do |t|
      t.string :tingkat

      t.timestamps
    end
  end
end
