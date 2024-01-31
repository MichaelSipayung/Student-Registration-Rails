# frozen_string_literal: true

class CreateHighSchoolMajors < ActiveRecord::Migration[7.1]
  def change
    create_table :high_school_majors do |t|
      t.string :jurusan

      t.timestamps
    end
  end
end
