# frozen_string_literal: true

class AddUserRefToPmdkTotalScoreInformation < ActiveRecord::Migration[7.1]
  def change
    add_reference :pmdk_total_score_informations, :user, null: false, foreign_key: true
  end
end
