# frozen_string_literal: true

# accreditation school list model : handle accreditation school list
class AccreditationSchoolList < ApplicationRecord
  validates :akreditasi, presence: true, length: {
    minimum: 1, maximum: 15
  }, uniqueness: true
end
