require "test_helper"

class AddressProvinceListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {
      session: {email: users(:michael).email, password: 'password'}
    }
    @address_province_list = address_province_lists(:aceh)
  end

  test "should get index" do
    get address_province_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_address_province_list_url
    assert_response :success
  end

  test "should create address_province_list" do
    assert_difference("AddressProvinceList.count") do
      post address_province_lists_url,
           params: { address_province_list: { provinsi: 'jawa tengah' } }
    end

    assert_redirected_to address_province_list_url(AddressProvinceList.last)
  end

  test "should show address_province_list" do
    get address_province_list_url(@address_province_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_province_list_url(@address_province_list)
    assert_response :success
  end

  test "should update address_province_list" do
    patch address_province_list_url(@address_province_list),
          params: { address_province_list: { provinsi: 'jawa barat' } }
    assert_redirected_to address_province_list_url(@address_province_list)
  end

  test "should destroy address_province_list" do
    assert_difference("AddressProvinceList.count", -1) do
      delete address_province_list_url(@address_province_list)
    end

    assert_redirected_to address_province_lists_url
  end
end
