# frozen_string_literal: true

# model PmdkTotalScoreInformation : handle pmdk_total_score_information
class PmdkTotalScoreInformation < ApplicationRecord
  belongs_to :user
  validates :jumlah_nilai_semester_1, :jumlah_nilai_semester_2, :jumlah_nilai_semester_3,
            :jumlah_nilai_semester_4, :jumlah_nilai_semester_5, presence: true,
                                                                numericality: { only_integer: false, greater_than_or_equal_to: 2, less_than_or_equal_to: 3000 }
  validates :jumlah_pelajaran_semester_1, :jumlah_pelajaran_semester_2, :jumlah_pelajaran_semester_3,
            :jumlah_pelajaran_semester_4, :jumlah_pelajaran_semester_5, presence: true,
                                                                        numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 30 }
  has_one_attached :surat_rekomendasi
  validates :surat_rekomendasi, content_type: [:pdf], size: { less_than: 1.megabytes }
end
