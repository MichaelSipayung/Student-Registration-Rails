class AddUserRefToSource < ActiveRecord::Migration[7.1]
  def change
    add_reference :sources, :user, null: false, foreign_key: true
  end
end
