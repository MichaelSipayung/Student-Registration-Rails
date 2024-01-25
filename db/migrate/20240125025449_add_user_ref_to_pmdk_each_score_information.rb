class AddUserRefToPmdkEachScoreInformation < ActiveRecord::Migration[7.1]
  def change
    add_reference :pmdk_each_score_informations, :user, null: false, foreign_key: true
  end
end
