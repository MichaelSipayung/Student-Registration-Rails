# frozen_string_literal: true

# model pmdk_school_list : handle pmdk_school_list
class PmdkSchoolList < ApplicationRecord
  validates :sekolah, presence: true,
                      length: { minimum: 5, maximum: 35 }, uniqueness: true
end
