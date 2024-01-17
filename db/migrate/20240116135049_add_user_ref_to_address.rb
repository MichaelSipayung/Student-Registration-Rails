class AddUserRefToAddress < ActiveRecord::Migration[7.1]
  def change
    add_reference :addresses, :user, null: false, foreign_key: true
  end
end
