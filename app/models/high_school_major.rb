class HighSchoolMajor < ApplicationRecord
  validates :jurusan, presence: true, length: {minimum: 3, maximum:25}, uniqueness: true
end
