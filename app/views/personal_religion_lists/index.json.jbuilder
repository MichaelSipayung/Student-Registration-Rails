# frozen_string_literal: true

json.array! @personal_religion_lists, partial: 'personal_religion_lists/personal_religion_list',
                                      as: :personal_religion_list
