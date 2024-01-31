# frozen_string_literal: true

class AddIndexToUsersEmail < ActiveRecord::Migration[7.1]
  def change
    # add index to users email
    add_index :users, :email, unique: true
  end
end
