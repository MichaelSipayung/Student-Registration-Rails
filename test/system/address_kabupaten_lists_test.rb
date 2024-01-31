# frozen_string_literal: true

require 'application_system_test_case'

class AddressKabupatenListsTest < ApplicationSystemTestCase
  setup do
    @address_kabupaten_list = address_kabupaten_lists(:one)
  end

  test 'visiting the index' do
    visit address_kabupaten_lists_url
    assert_selector 'h1', text: 'Address kabupaten lists'
  end

  test 'should create address kabupaten list' do
    visit address_kabupaten_lists_url
    click_on 'New address kabupaten list'

    fill_in 'Kabupaten', with: @address_kabupaten_list.kabupaten
    click_on 'Create Address kabupaten list'

    assert_text 'Address kabupaten list was successfully created'
    click_on 'Back'
  end

  test 'should update Address kabupaten list' do
    visit address_kabupaten_list_url(@address_kabupaten_list)
    click_on 'Edit this address kabupaten list', match: :first

    fill_in 'Kabupaten', with: @address_kabupaten_list.kabupaten
    click_on 'Update Address kabupaten list'

    assert_text 'Address kabupaten list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Address kabupaten list' do
    visit address_kabupaten_list_url(@address_kabupaten_list)
    click_on 'Destroy this address kabupaten list', match: :first

    assert_text 'Address kabupaten list was successfully destroyed'
  end
end
