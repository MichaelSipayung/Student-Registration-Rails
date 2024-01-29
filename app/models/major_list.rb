class MajorList < ApplicationRecord
  validates :jurusan, presence:true, length: {minimum: 4, maximum: 30}, uniqueness: true
end
