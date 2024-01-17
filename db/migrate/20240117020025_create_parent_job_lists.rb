class CreateParentJobLists < ActiveRecord::Migration[7.1]
  def change
    create_table :parent_job_lists do |t|
      t.string :pekerjaan

      t.timestamps
    end
  end
end
