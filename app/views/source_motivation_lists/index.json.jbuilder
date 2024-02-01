# frozen_string_literal: true

json.array! @source_motivation_lists, partial: 'source_motivation_lists/source_motivation_list',
                                      as: :source_motivation_list
