class CreateAccreditationSchoolLists < ActiveRecord::Migration[7.1]
  def change
    create_table :accreditation_school_lists do |t|
      t.string :akreditasi

      t.timestamps
    end
  end
end
