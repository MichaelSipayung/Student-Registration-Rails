class CreatePersonalReligionLists < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_religion_lists do |t|
      t.string :agama

      t.timestamps
    end
  end
end
