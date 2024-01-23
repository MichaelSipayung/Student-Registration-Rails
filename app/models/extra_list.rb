class ExtraList < ApplicationRecord
  validates :predikat, presence: true, length: {minimum: 4, maximum: 15}, uniqueness: true
end
