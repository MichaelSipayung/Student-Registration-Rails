require "test_helper"

class AchievementTingkatListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
    @achievement_tingkat_list = achievement_tingkat_lists(:one)
  end

  test "should get index" do
    get achievement_tingkat_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_achievement_tingkat_list_url
    assert_response :success
  end

  test "should create achievement_tingkat_list" do
    assert_difference("AchievementTingkatList.count") do
      post achievement_tingkat_lists_url,
           params: { achievement_tingkat_list: { tingkat: 'nasional' } }
    end

    assert_redirected_to achievement_tingkat_list_url(AchievementTingkatList.last)
  end

  test "should show achievement_tingkat_list" do
    get achievement_tingkat_list_url(@achievement_tingkat_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_achievement_tingkat_list_url(@achievement_tingkat_list)
    assert_response :success
  end

  test "should update achievement_tingkat_list" do
    patch achievement_tingkat_list_url(@achievement_tingkat_list),
          params: { achievement_tingkat_list: { tingkat: 'internasional' } }
    assert_redirected_to achievement_tingkat_list_url(@achievement_tingkat_list)
  end

  test "should destroy achievement_tingkat_list" do
    assert_difference("AchievementTingkatList.count", -1) do
      delete achievement_tingkat_list_url(@achievement_tingkat_list)
    end

    assert_redirected_to achievement_tingkat_lists_url
  end
end
