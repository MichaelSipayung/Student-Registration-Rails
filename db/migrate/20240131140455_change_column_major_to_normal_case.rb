# frozen_string_literal: true

class ChangeColumnMajorToNormalCase < ActiveRecord::Migration[7.1]
  def change
    rename_column :majors, :jurusan_1, :jurusan1
    rename_column :majors, :jurusan_2, :jurusan2
    rename_column :majors, :jurusan_3, :jurusan3
  end
end
