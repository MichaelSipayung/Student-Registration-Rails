class AllSchoolList < ApplicationRecord
  validates :sekolah, presence: true,
            length: {minimum: 5, maximum: 35}, uniqueness: true
end
