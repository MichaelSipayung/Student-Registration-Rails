class AccreditationSchoolList < ApplicationRecord
  validates :akreditasi, presence: true, length: {
    minimum: 1, maximum: 15
  }, uniqueness: true
end
