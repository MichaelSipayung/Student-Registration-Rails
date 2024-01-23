class ParentEducationList < ApplicationRecord
  validates :pendidikan, presence: true, length: {minimum: 2, maximum: 20}, uniqueness: true
end
