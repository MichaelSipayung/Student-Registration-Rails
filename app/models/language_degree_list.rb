# frozen_string_literal: true

# model language_degree_list : handle language_degree_list
class LanguageDegreeList < ApplicationRecord
  validates :tingkat, presence: true, length: { minimum: 4, maximum: 15 }
end
