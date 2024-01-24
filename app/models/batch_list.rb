class BatchList < ApplicationRecord
  validates :gelombang, presence: true, length: {minimum: 4, maximum: 25}, uniqueness: true
  #aktif must boolean
  validate :aktif_is_boolean
  private
  def aktif_is_boolean
    errors.add(:aktif, "must be boolean") unless [true, false].include? aktif
  end
end
