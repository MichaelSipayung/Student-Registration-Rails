require "test_helper"

class ExtraListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email,
      password: 'password'
    }}
    @extra_list = extra_lists(:one)
  end

  test "should get index" do
    get extra_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_extra_list_url
    assert_response :success
  end

  test "should create extra_list" do
    assert_difference("ExtraList.count") do
      post extra_lists_url, params: { extra_list: { predikat: 'sangat baik' } }
    end

    assert_redirected_to extra_list_url(ExtraList.last)
  end

  test "should show extra_list" do
    get extra_list_url(@extra_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_extra_list_url(@extra_list)
    assert_response :success
  end

  test "should update extra_list" do
    patch extra_list_url(@extra_list), params: { extra_list: { predikat: 'tidak selesai' } }
    assert_redirected_to extra_list_url(@extra_list)
  end

  test "should destroy extra_list" do
    assert_difference("ExtraList.count", -1) do
      delete extra_list_url(@extra_list)
    end

    assert_redirected_to extra_lists_url
  end
end
