# model SourceMotivationList : handle source_motivation_list
class SourceMotivationList < ApplicationRecord
  validates :motivasi, presence: true,  length: {minimum: 4, maximum: 20}, uniqueness: true
end
