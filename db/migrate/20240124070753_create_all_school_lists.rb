class CreateAllSchoolLists < ActiveRecord::Migration[7.1]
  def change
    create_table :all_school_lists do |t|
      t.string :sekolah

      t.timestamps
    end
  end
end
