class SourceInformationList < ApplicationRecord
  validates :informasi, presence: true,  length: {minimum: 4, maximum: 25}, uniqueness: true
end
