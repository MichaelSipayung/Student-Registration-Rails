# frozen_string_literal: true

class RenameColumnUtbk < ActiveRecord::Migration[7.1]
  def change
    rename_column :utbk_scores, :jumlah_pelajaran_semester_6,
                  :jumlah_pelajaran_semester6
    rename_column :utbk_scores, :jumlah_nilai_semester_6,
                  :jumlah_nilai_semester6
  end
end
