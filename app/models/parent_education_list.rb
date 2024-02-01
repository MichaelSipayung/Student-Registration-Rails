# frozen_string_literal: true

# model parent_education_list : handle parent_education_list
class ParentEducationList < ApplicationRecord
  validates :pendidikan, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
end
