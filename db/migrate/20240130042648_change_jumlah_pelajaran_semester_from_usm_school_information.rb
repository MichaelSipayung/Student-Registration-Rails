class ChangeJumlahPelajaranSemesterFromUsmSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    change_column :usm_school_informations, :jumlah_pelajaran_semester_5,
                  :integer
  end
end
