class RenameColumnTotalScore < ActiveRecord::Migration[7.1]
  def change
    rename_column :pmdk_total_score_informations, :jumlah_nilai_semester_1,
                  :jumlah_nilai_semester1
    rename_column :pmdk_total_score_informations, :jumlah_nilai_semester_2,
                  :jumlah_nilai_semester2
    rename_column :pmdk_total_score_informations, :jumlah_nilai_semester_3,
                  :jumlah_nilai_semester3
    rename_column :pmdk_total_score_informations, :jumlah_nilai_semester_4,
                  :jumlah_nilai_semester4
    rename_column :pmdk_total_score_informations, :jumlah_nilai_semester_5,
                  :jumlah_nilai_semester5
    rename_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_1,
                  :jumlah_pelajaran_semester1
    rename_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_2,
                  :jumlah_pelajaran_semester2
    rename_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_3,
                  :jumlah_pelajaran_semester3
    rename_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_4,
                  :jumlah_pelajaran_semester4
    rename_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_5,
                  :jumlah_pelajaran_semester5
  end
end
