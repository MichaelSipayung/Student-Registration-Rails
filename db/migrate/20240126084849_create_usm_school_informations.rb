# frozen_string_literal: true

class CreateUsmSchoolInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :usm_school_informations do |t|
      t.string :asal_sekolah
      t.string :akreditas
      t.integer :jumlah_pelajaran_un
      t.decimal :jumlah_nilai_un
      t.string :jurusan_sekolah
      t.integer :jumlah_pelajaran_semester_5
      t.decimal :jumlah_nilai_semester_5

      t.timestamps
    end
  end
end
