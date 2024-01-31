# personal_gender_list model
class PersonalGenderList < ApplicationRecord
  validates :jenis_kelamin, presence: true, length: {minimum: 4, maximum: 10}, uniqueness: true
end
