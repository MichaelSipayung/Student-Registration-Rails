class PersonalReligionList < ApplicationRecord
  validates :agama, presence: true, length: {minimum: 4, maximum: 20}, uniqueness: true

end
