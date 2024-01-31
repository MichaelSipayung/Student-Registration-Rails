# frozen_string_literal: true

# model Source : handle source
class Source < ApplicationRecord
  belongs_to :user
  validates :motivasi, presence: true, length: { minimum: 4, maximum: 30 }
  validates :sumber_informasi, presence: true, length: { minimum: 4, maximum: 30 }
  # jumlah_n  is integer and between 1-50
  validates :jumlah_n, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
end
