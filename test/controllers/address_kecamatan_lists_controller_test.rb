require "test_helper"

class AddressKecamatanListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {
      session: {email: users(:michael).email, password: 'password'}
    }
    @address_kecamatan_list = address_kecamatan_lists(:kecacehtengah)
  end

  test 'should get index' do
    get address_kecamatan_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_address_kecamatan_list_url
    assert_response :success
  end

  test 'should create address_kecamatan_list' do
    @kab = address_kabupaten_lists(:acehtengah)
    assert_difference("AddressKecamatanList.count") do
      post address_kecamatan_lists_url,
           params: { address_kecamatan_list: { kecamatan: 'aceh barat',
                                               address_kabupaten_list_id: @kab.id} }
    end
    assert_not_nil AddressKecamatanList.find_by_kecamatan 'aceh barat'
    assert_redirected_to address_kecamatan_list_url(AddressKecamatanList.last)
  end

  test 'should show address_kecamatan_list' do
    get address_kecamatan_list_url(@address_kecamatan_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_address_kecamatan_list_url(@address_kecamatan_list)
    assert_response :success
  end

  test 'should update address_kecamatan_list' do
    patch address_kecamatan_list_url(@address_kecamatan_list),
          params: { address_kecamatan_list: { kecamatan: 'ngurah' } }
    assert_not_nil AddressKecamatanList.find_by_kecamatan 'ngurah'
    assert_redirected_to address_kecamatan_list_url(@address_kecamatan_list)
  end

  test 'should destroy address_kecamatan_list' do
    assert_difference("AddressKecamatanList.count", -1) do
      delete address_kecamatan_list_url(@address_kecamatan_list)
    end

    assert_redirected_to address_kecamatan_lists_url
  end
end
