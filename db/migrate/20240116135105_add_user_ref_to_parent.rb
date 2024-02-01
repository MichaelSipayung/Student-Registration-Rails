# frozen_string_literal: true

class AddUserRefToParent < ActiveRecord::Migration[7.1]
  def change
    add_reference :parents, :user, null: false, foreign_key: true
  end
end
