class AddUserRefToUsmSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    add_reference :usm_school_informations, :user, null: false, foreign_key: true
  end
end
