# frozen_string_literal: true

class AddUserRefToPmdkSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    add_reference :pmdk_school_informations, :user, null: false, foreign_key: true
  end
end
