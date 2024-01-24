class CreatePmdkSchoolLists < ActiveRecord::Migration[7.1]
  def change
    create_table :pmdk_school_lists do |t|
      t.string :sekolah

      t.timestamps
    end
  end
end
