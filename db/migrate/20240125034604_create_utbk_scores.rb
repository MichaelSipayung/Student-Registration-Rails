# frozen_string_literal: true

class CreateUtbkScores < ActiveRecord::Migration[7.1]
  def change
    create_table :utbk_scores do |t|
      t.string :no_peserta
      t.date :tanggal_ujian
      t.numeric :nilai_penalaran_umum
      t.numeric :nilai_pengetahuan_kuantitatif
      t.numeric :nilai_pengetahuan_dan_pemahaman_umum
      t.numeric :nilai_kemampuan_memahami_bacaan_dan_menulis
      t.numeric :jumlah_pelajaran_semester_6
      t.numeric :jumlah_nilai_semester_6
      t.timestamps
    end
  end
end
