class CreateLanguageNameLists < ActiveRecord::Migration[7.1]
  def change
    create_table :language_name_lists do |t|
      t.string :bahasa

      t.timestamps
    end
  end
end
