class MajorList < ApplicationRecord
  validates :jurusan, presence:true, length: {minimum: 4, maximum: 25}, uniqueness: true
end
