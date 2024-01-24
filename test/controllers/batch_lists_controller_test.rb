require "test_helper"

class BatchListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
    @batch_list = batch_lists(:one)
  end

  test "should get index" do
    get batch_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_list_url
    assert_response :success
  end

  test "should create batch_list" do
    assert_difference("BatchList.count") do
      post batch_lists_url, params:
        { batch_list: { aktif: false, gelombang: 'usm 1' } }
    end

    assert_redirected_to batch_list_url(BatchList.last)
  end

  test "should show batch_list" do
    get batch_list_url(@batch_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_list_url(@batch_list)
    assert_response :success
  end

  test "should update batch_list" do
    patch batch_list_url(@batch_list),
          params: { batch_list: { aktif: true, gelombang: 'pmdk medan' } }
    assert_redirected_to batch_list_url(@batch_list)
  end

  test "should destroy batch_list" do
    assert_difference("BatchList.count", -1) do
      delete batch_list_url(@batch_list)
    end

    assert_redirected_to batch_lists_url
  end
end
