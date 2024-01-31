# frozen_string_literal: true

class ChangeJumlahPelajaranUnFromUtbkSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    change_column :utbk_school_informations, :jumlah_pelajaran_un,
                  :integer
  end
end
