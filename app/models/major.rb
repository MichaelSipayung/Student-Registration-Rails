# frozen_string_literal: true

# model major : handle major
class Major < ApplicationRecord
  belongs_to :user
  validates :jurusan1, presence: true, length: { minimum: 4, maximum: 30 }
  validates :jurusan2, presence: true, length: { minimum: 4, maximum: 30 }
  validates :jurusan3, presence: true, length: { minimum: 4, maximum: 30 }
  validates :gelombang, presence: true, length: { minimum: 4, maximum: 30 }
  validate :jurusan1_not_equal_jurusan2
  validate :jurusan1_not_equal_jurusan3
  validate :jurusan2_not_equal_jurusan3

  private

  def jurusan1_not_equal_jurusan2
    return unless jurusan1 == jurusan2

    errors.add(:jurusan1, "can't be equal to jurusan_2")
  end

  def jurusan1_not_equal_jurusan3
    return unless jurusan1 == jurusan3

    errors.add(:jurusan1, "can't be equal to jurusan_3")
  end

  def jurusan2_not_equal_jurusan3
    return unless jurusan2 == jurusan3

    errors.add(:jurusan2, "can't be equal to jurusan_3")
  end
end
