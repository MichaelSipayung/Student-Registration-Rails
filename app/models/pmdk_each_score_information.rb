# frozen_string_literal: true

# model pmdk_each_score_information : handle pmdk_each_score_information
class PmdkEachScoreInformation < ApplicationRecord
  belongs_to :user
  validates :matematika_semester1, :matematika_semester2, :matematika_semester3, :matematika_semester4,
            :matematika5, :kimia1, :kimia2, :kimia3, :kimia4,
            :kimia5, :fisika1, :fisika2, :fisika3, :fisika4,
            :fisika5, :inggris1, :inggris2, :inggris3,
            :inggris4, :inggris5, presence: true,
                                  numericality: { only_integer: false, greater_than_or_equal_to: 2, less_than_or_equal_to: 100 }
  has_one_attached :sertifikat
  validates :sertifikat, content_type: [:pdf], size: { less_than: 1.megabytes }
end
