# high school major model : handle high_school_major
class HighSchoolMajor < ApplicationRecord
  validates :jurusan, presence: true, length: {minimum: 3, maximum:25}, uniqueness: true
end
