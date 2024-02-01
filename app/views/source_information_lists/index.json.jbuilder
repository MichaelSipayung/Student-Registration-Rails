# frozen_string_literal: true

json.array! @source_information_lists, partial: 'source_information_lists/source_information_list',
                                       as: :source_information_list
