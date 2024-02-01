# frozen_string_literal: true

class ChangeColumnPmdkEachToNormalCase < ActiveRecord::Migration[7.1]
  def change
    rename_column :pmdk_each_score_informations, :matematika_semester_1,
                  :matematika_semester1
    rename_column :pmdk_each_score_informations, :matematika_semester_2,
                  :matematika_semester2
    rename_column :pmdk_each_score_informations, :matematika_semester_3,
                  :matematika_semester3
    rename_column :pmdk_each_score_informations, :matematika_semester_4,
                  :matematika_semester4
  end
end
