# parent_job_list model : handle parent_job_list
class ParentJobList < ApplicationRecord
  validates :pekerjaan, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: true
end
