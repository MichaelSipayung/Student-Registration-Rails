# frozen_string_literal: true

require 'test_helper'

class AddressKabupatenListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {
      session: { email: users(:michael).email, password: 'password' }
    }
    @address_kabupaten_list = address_kabupaten_lists(:acehtengah)
  end

  test 'should get index' do
    get address_kabupaten_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_address_kabupaten_list_url
    assert_response :success
  end

  test 'should create address_kabupaten_list' do
    assert_difference('AddressKabupatenList.count') do
      post address_kabupaten_lists_url,
           params: { address_kabupaten_list:
                       { kabupaten: 'luake',
                         address_province_list_id: address_province_lists(:aceh).id } }
    end
    assert_redirected_to address_kabupaten_list_url(AddressKabupatenList.last)
  end

  test 'should show address_kabupaten_list' do
    get address_kabupaten_list_url(@address_kabupaten_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_address_kabupaten_list_url(@address_kabupaten_list)
    assert_response :success
  end

  test 'should update address_kabupaten_list' do
    patch address_kabupaten_list_url(@address_kabupaten_list),
          params: { address_kabupaten_list: { kabupaten: 'lumajang' } }
    assert_redirected_to address_kabupaten_list_url(@address_kabupaten_list)
  end

  test 'should destroy address_kabupaten_list' do
    assert_not_nil AddressKabupatenList.find_by_kabupaten 'kab aceh timur'
    assert_not_nil AddressKabupatenList.find_by_kabupaten 'kab aceh tengah'

    assert_difference('AddressKabupatenList.count', -1) do
      delete address_kabupaten_list_url(@address_kabupaten_list)
    end
    assert_nil AddressKabupatenList.find_by_kabupaten 'kab aceh tengah'

    @address_kabupaten_list = address_kabupaten_lists(:acehtimur)
    assert_difference('AddressKabupatenList.count', -1) do
      delete address_kabupaten_list_url(@address_kabupaten_list)
    end
    assert_nil AddressKabupatenList.find_by_kabupaten 'kab aceh timur'
    assert_redirected_to address_kabupaten_lists_url
  end
end
