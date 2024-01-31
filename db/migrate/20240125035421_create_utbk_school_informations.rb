# frozen_string_literal: true

class CreateUtbkSchoolInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :utbk_school_informations do |t|
      t.string :asal_sekolah
      t.string :akreditas
      t.numeric :jumlah_pelajaran_un
      t.numeric :jumlah_nilai_un

      t.timestamps
    end
  end
end
