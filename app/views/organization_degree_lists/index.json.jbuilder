# frozen_string_literal: true

json.array! @organization_degree_lists, partial: 'organization_degree_lists/organization_degree_list',
                                        as: :organization_degree_list
