require "test_helper"

class PersonalReligionListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: "password"
    }}
    @personal_religion_list = personal_religion_lists(:one)
  end

  test "should get index" do
    get personal_religion_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_religion_list_url
    assert_response :success
  end

  test "should create personal_religion_list" do
    assert_difference("PersonalReligionList.count") do
      post personal_religion_lists_url, params: { personal_religion_list: { agama: 'kristen' } }
    end

    assert_redirected_to personal_religion_list_url(PersonalReligionList.last)
  end

  test "should show personal_religion_list" do
    get personal_religion_list_url(@personal_religion_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_religion_list_url(@personal_religion_list)
    assert_response :success
  end

  test "should update personal_religion_list" do
    patch personal_religion_list_url(@personal_religion_list),
          params: { personal_religion_list: { agama: 'agama' } }
    assert_redirected_to personal_religion_list_url(@personal_religion_list)
  end

  test "should destroy personal_religion_list" do
    assert_difference("PersonalReligionList.count", -1) do
      delete personal_religion_list_url(@personal_religion_list)
    end

    assert_redirected_to personal_religion_lists_url
  end
end
