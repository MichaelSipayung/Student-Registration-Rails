class AddJurusanSekolahToPmdkSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    add_column :pmdk_school_informations, :jurusan_sekolah, :string
  end
end
