class LanguageDegreeList < ApplicationRecord
  validates :tingkat, presence: true, length: {minimum: 4, maximum: 15}
end
