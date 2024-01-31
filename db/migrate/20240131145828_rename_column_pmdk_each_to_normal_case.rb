# frozen_string_literal: true

class RenameColumnPmdkEachToNormalCase < ActiveRecord::Migration[7.1]
  def change
    rename_column :pmdk_each_score_informations, :matematika_semester_5,
                  :matematika5
    rename_column :pmdk_each_score_informations, :fisika_semester_1,
                  :fisika1
    rename_column :pmdk_each_score_informations, :fisika_semester_2,
                  :fisika2
    rename_column :pmdk_each_score_informations, :fisika_semester_3,
                  :fisika3
    rename_column :pmdk_each_score_informations, :fisika_semester_4,
                  :fisika4
    rename_column :pmdk_each_score_informations, :fisika_semester_5,
                  :fisika5
    rename_column :pmdk_each_score_informations, :kimia_semester_1,
                  :kimia1
    rename_column :pmdk_each_score_informations, :kimia_semester_2,
                  :kimia2
    rename_column :pmdk_each_score_informations, :kimia_semester_3,
                  :kimia3
    rename_column :pmdk_each_score_informations, :kimia_semester_4,
                  :kimia4
    rename_column :pmdk_each_score_informations, :kimia_semester_5,
                  :kimia5
    rename_column :pmdk_each_score_informations, :inggris1,
                  :inggris1
    rename_column :pmdk_each_score_informations, :bahasa_inggris_semester_2,
                  :inggri2
    rename_column :pmdk_each_score_informations, :bahasa_inggris_semester_3,
                  :inggris3
    rename_column :pmdk_each_score_informations, :bahasa_inggris_semester_4,
                  :inggris4
    rename_column :pmdk_each_score_informations, :bahasa_inggris_semester_5,
                  :inggris5
  end
end
