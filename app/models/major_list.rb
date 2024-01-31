# model major_list : handle major_list
class MajorList < ApplicationRecord
  validates :jurusan, presence:true, length: {minimum: 4, maximum: 30}, uniqueness: true
end
