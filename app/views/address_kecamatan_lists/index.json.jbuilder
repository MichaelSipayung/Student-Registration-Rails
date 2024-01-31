# frozen_string_literal: true

json.array! @address_kecamatan_lists, partial: 'address_kecamatan_lists/address_kecamatan_list',
                                      as: :address_kecamatan_list
