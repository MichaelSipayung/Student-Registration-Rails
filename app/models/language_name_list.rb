class LanguageNameList < ApplicationRecord
  validates :bahasa, presence: true, length: {minimum: 4, maximum: 15}, uniqueness: true
end
