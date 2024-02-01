# frozen_string_literal: true

class RenameColumnInPmdk < ActiveRecord::Migration[7.1]
  def change
    rename_column :pmdk_each_score_informations, :inggri2, :inggris2
  end
end
