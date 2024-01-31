# model PersonalReligionList : handle personal_religion_list
class PersonalReligionList < ApplicationRecord
  validates :agama, presence: true, length: {minimum: 4, maximum: 20}, uniqueness: true
end
