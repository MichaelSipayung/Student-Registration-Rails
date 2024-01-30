class ChangeJumlahPelajaranUnFromPmdkSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    change_column :pmdk_school_informations, :jumlah_pelajaran_un,
                  :integer
  end
end
