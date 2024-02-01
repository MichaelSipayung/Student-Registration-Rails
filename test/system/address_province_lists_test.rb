# frozen_string_literal: true

require 'application_system_test_case'

class AddressProvinceListsTest < ApplicationSystemTestCase
  setup do
    @address_province_list = address_province_lists(:one)
  end

  test 'visiting the index' do
    visit address_province_lists_url
    assert_selector 'h1', text: 'Address province lists'
  end

  test 'should create address province list' do
    visit address_province_lists_url
    click_on 'New address province list'

    fill_in 'Provinsi', with: @address_province_list.provinsi
    click_on 'Create Address province list'

    assert_text 'Address province list was successfully created'
    click_on 'Back'
  end

  test 'should update Address province list' do
    visit address_province_list_url(@address_province_list)
    click_on 'Edit this address province list', match: :first

    fill_in 'Provinsi', with: @address_province_list.provinsi
    click_on 'Update Address province list'

    assert_text 'Address province list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Address province list' do
    visit address_province_list_url(@address_province_list)
    click_on 'Destroy this address province list', match: :first

    assert_text 'Address province list was successfully destroyed'
  end
end
