# frozen_string_literal: true

json.array! @address_kabupaten_lists, partial: 'address_kabupaten_lists/address_kabupaten_list',
                                      as: :address_kabupaten_list
