# frozen_string_literal: true

# model pmdk_each_score_information : handle pmdk_each_score_information
class PmdkEachScoreInformation < ApplicationRecord
  belongs_to :user
  validates :matematika_semester_1, :matematika_semester_2, :matematika_semester_3, :matematika_semester_4,
            :matematika_semester_5, :kimia_semester_1, :kimia_semester_2, :kimia_semester_3, :kimia_semester_4,
            :kimia_semester_5, :fisika_semester_1, :fisika_semester_2, :fisika_semester_3, :fisika_semester_4,
            :fisika_semester_5, :bahasa_inggris_semester_1, :bahasa_inggris_semester_2, :bahasa_inggris_semester_3,
            :bahasa_inggris_semester_4, :bahasa_inggris_semester_5, presence: true,
                                                                    numericality: { only_integer: false, greater_than_or_equal_to: 2, less_than_or_equal_to: 100 }
  has_one_attached :sertifikat
  validates :sertifikat, content_type: [:pdf], size: { less_than: 1.megabytes }
end
