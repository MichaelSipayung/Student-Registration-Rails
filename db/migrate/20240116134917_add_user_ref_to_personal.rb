# frozen_string_literal: true

class AddUserRefToPersonal < ActiveRecord::Migration[7.1]
  def change
    add_reference :personals, :user, null: false, foreign_key: true
  end
end
