class CreatePersonalGenderLists < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_gender_lists do |t|
      t.string :jenis_kelamin

      t.timestamps
    end
  end
end
