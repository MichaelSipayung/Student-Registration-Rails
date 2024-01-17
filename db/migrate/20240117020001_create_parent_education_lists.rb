class CreateParentEducationLists < ActiveRecord::Migration[7.1]
  def change
    create_table :parent_education_lists do |t|
      t.string :pendidikan

      t.timestamps
    end
  end
end
