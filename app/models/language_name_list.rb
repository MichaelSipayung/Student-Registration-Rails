# frozen_string_literal: true

# model language_name_list : handle language_name_list
class LanguageNameList < ApplicationRecord
  validates :bahasa, presence: true, length: { minimum: 4, maximum: 15 }, uniqueness: true
end
