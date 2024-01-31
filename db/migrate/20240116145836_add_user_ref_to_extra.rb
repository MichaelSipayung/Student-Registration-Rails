# frozen_string_literal: true

class AddUserRefToExtra < ActiveRecord::Migration[7.1]
  def change
    add_reference :extras, :user, null: false, foreign_key: true
  end
end
