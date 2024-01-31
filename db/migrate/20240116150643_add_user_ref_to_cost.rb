# frozen_string_literal: true

class AddUserRefToCost < ActiveRecord::Migration[7.1]
  def change
    add_reference :costs, :user, null: false, foreign_key: true
  end
end
