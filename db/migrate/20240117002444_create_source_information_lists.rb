class CreateSourceInformationLists < ActiveRecord::Migration[7.1]
  def change
    create_table :source_information_lists do |t|
      t.string :informasi

      t.timestamps
    end
  end
end
