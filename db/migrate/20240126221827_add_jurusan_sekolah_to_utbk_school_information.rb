# frozen_string_literal: true

class AddJurusanSekolahToUtbkSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    add_column :utbk_school_informations, :jurusan_sekolah, :string
  end
end
