# frozen_string_literal: true

require 'application_system_test_case'

class AddressKecamatanListsTest < ApplicationSystemTestCase
  setup do
    @address_kecamatan_list = address_kecamatan_lists(:one)
  end

  test 'visiting the index' do
    visit address_kecamatan_lists_url
    assert_selector 'h1', text: 'Address kecamatan lists'
  end

  test 'should create address kecamatan list' do
    visit address_kecamatan_lists_url
    click_on 'New address kecamatan list'

    fill_in 'Kecamatan', with: @address_kecamatan_list.kecamatan
    click_on 'Create Address kecamatan list'

    assert_text 'Address kecamatan list was successfully created'
    click_on 'Back'
  end

  test 'should update Address kecamatan list' do
    visit address_kecamatan_list_url(@address_kecamatan_list)
    click_on 'Edit this address kecamatan list', match: :first

    fill_in 'Kecamatan', with: @address_kecamatan_list.kecamatan
    click_on 'Update Address kecamatan list'

    assert_text 'Address kecamatan list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Address kecamatan list' do
    visit address_kecamatan_list_url(@address_kecamatan_list)
    click_on 'Destroy this address kecamatan list', match: :first

    assert_text 'Address kecamatan list was successfully destroyed'
  end
end
