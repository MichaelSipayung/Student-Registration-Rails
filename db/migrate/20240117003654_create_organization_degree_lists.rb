class CreateOrganizationDegreeLists < ActiveRecord::Migration[7.1]
  def change
    create_table :organization_degree_lists do |t|
      t.string :jabatan

      t.timestamps
    end
  end
end
