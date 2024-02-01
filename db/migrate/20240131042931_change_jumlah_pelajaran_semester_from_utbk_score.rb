# frozen_string_literal: true

class ChangeJumlahPelajaranSemesterFromUtbkScore < ActiveRecord::Migration[7.1]
  def change
    change_column :utbk_scores, :jumlah_pelajaran_semester_6, :integer
  end
end
