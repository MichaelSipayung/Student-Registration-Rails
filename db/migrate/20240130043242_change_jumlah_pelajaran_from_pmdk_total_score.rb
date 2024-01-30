class ChangeJumlahPelajaranFromPmdkTotalScore < ActiveRecord::Migration[7.1]
  def change
    change_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_5,
                  :integer
    change_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_4,
                  :integer
    change_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_3,
                  :integer
    change_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_2,
                  :integer
    change_column :pmdk_total_score_informations, :jumlah_pelajaran_semester_1,
                  :integer
  end
end
