# frozen_string_literal: true

class AddUserRefToMajor < ActiveRecord::Migration[7.1]
  def change
    add_reference :majors, :user, null: false, foreign_key: true
  end
end
