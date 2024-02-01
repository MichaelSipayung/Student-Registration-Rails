# frozen_string_literal: true

class AddUserRefToUtbkScore < ActiveRecord::Migration[7.1]
  def change
    add_reference :utbk_scores, :user, null: false, foreign_key: true
  end
end
