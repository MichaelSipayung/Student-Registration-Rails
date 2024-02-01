class RenameColumnUsm < ActiveRecord::Migration[7.1]
  def change
    rename_column :usm_school_informations, :jumlah_nilai_semester_5,
                  :jumlah_nilai_semester5
    rename_column :usm_school_informations, :jumlah_pelajaran_semester_5,
                  :jumlah_pelajaran_semester5
  end
end
