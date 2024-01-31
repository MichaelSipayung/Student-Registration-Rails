# organization_degree_list model : handle organization_degree_list
class OrganizationDegreeList < ApplicationRecord
  validates :jabatan, presence: true, length: {minimum: 3, maximum: 15}, uniqueness: true
end
