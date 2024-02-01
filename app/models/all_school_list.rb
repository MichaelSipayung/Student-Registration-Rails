# frozen_string_literal: true

# model all_school_list : handle all_school_list
class AllSchoolList < ApplicationRecord
  validates :sekolah, presence: true,
                      length: { minimum: 5, maximum: 35 }, uniqueness: true
end
