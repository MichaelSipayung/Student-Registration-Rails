require "test_helper"

class ParentEducationListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
    @parent_education_list = parent_education_lists(:one)
  end

  test "should get index" do
    get parent_education_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_parent_education_list_url
    assert_response :success
  end

  test "should create parent_education_list" do
    assert_difference("ParentEducationList.count") do
      post parent_education_lists_url, params: {
        parent_education_list: { pendidikan: 'slta' } }
    end

    assert_redirected_to parent_education_list_url(ParentEducationList.last)
  end

  test "should show parent_education_list" do
    get parent_education_list_url(@parent_education_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_parent_education_list_url(@parent_education_list)
    assert_response :success
  end

  test "should update parent_education_list" do
    patch parent_education_list_url(@parent_education_list),
          params: { parent_education_list: { pendidikan: 'sltp' } }
    assert_redirected_to parent_education_list_url(@parent_education_list)
  end

  test "should destroy parent_education_list" do
    assert_difference("ParentEducationList.count", -1) do
      delete parent_education_list_url(@parent_education_list)
    end

    assert_redirected_to parent_education_lists_url
  end
end
