# frozen_string_literal: true

# model UtbkScore : handle utbk_score
class UtbkScore < ApplicationRecord
  belongs_to :user
  validates :no_peserta, presence: true,
                         length: { minimum: 4, maximum: 30 }
  validates :tanggal_ujian, presence: true, length: { minimum: 4, maximum: 10 }
  validates :nilai_penalaran_umum,
            :nilai_pengetahuan_dan_pemahaman_umum,
            :nilai_pengetahuan_kuantitatif,
            :nilai_kemampuan_memahami_bacaan_dan_menulis,
            presence: true, numericality: { only_integer: false,
                                            greater_than_or_equal_to: 5, less_than_or_equal_to: 2000 }
  validates :jumlah_nilai_semester6,
            presence: true, numericality: { only_integer: false,
                                            greater_than_or_equal_to: 2, less_than_or_equal_to: 2000 }
  validates :jumlah_pelajaran_semester6,
            presence: true, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 2, less_than_or_equal_to: 100 }
  has_one_attached :sertifikat_utbk # active storange api
  validates :sertifikat_utbk, content_type: [:pdf], size: { less_than: 1.megabytes }
end
