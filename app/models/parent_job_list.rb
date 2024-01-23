class ParentJobList < ApplicationRecord
  validates :pekerjaan, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: true
end
