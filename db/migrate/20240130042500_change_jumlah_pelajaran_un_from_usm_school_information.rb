# frozen_string_literal: true

class ChangeJumlahPelajaranUnFromUsmSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    change_column :usm_school_informations, :jumlah_pelajaran_un,
                  :integer
  end
end
