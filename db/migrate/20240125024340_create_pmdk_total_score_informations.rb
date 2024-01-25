class CreatePmdkTotalScoreInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :pmdk_total_score_informations do |t|
      t.numeric :jumlah_nilai_semester_1
      t.numeric :jumlah_nilai_semester_2
      t.numeric :jumlah_nilai_semester_3
      t.numeric :jumlah_nilai_semester_4
      t.numeric :jumlah_nilai_semester_5
      t.numeric :jumlah_pelajaran_semester_1
      t.numeric :jumlah_pelajaran_semester_2
      t.numeric :jumlah_pelajaran_semester_3
      t.numeric :jumlah_pelajaran_semester_4
      t.numeric :jumlah_pelajaran_semester_5

      t.timestamps
    end
  end
end
