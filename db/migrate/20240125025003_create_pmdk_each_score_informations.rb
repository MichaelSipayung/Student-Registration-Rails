class CreatePmdkEachScoreInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :pmdk_each_score_informations do |t|
      t.numeric :matematika_semester_1
      t.numeric :matematika_semester_2
      t.numeric :matematika_semester_3
      t.numeric :matematika_semester_4
      t.numeric :matematika_semester_5

      t.numeric :fisika_semester_1
      t.numeric :fisika_semester_2
      t.numeric :fisika_semester_3
      t.numeric :fisika_semester_4
      t.numeric :fisika_semester_5

      t.numeric :kimia_semester_1
      t.numeric :kimia_semester_2
      t.numeric :kimia_semester_3
      t.numeric :kimia_semester_4
      t.numeric :kimia_semester_5

      t.numeric :bahasa_inggris_semester_1
      t.numeric :bahasa_inggris_semester_2
      t.numeric :bahasa_inggris_semester_3
      t.numeric :bahasa_inggris_semester_4
      t.numeric :bahasa_inggris_semester_5

      t.timestamps
    end
  end
end
