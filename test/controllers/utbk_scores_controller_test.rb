require "test_helper"

class UtbkScoresControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
  end
  test "should get new" do
    assert is_logged_in?
    get new_utbk_score_url
    assert_response :success
  end

  # test "should get update" do
  #   get utbk_scores_update_url
  #   assert_response :success
  # end
  #
  # test "should get create" do
  #   get utbk_scores_create_url
  #   assert_response :success
  # end
  #
  test "should get edit" do
    assert is_logged_in?
    get edit_utbk_score_url(utbk_scores(:utbk_score_two))
    assert_response :success
  end
  #
  # test "should get show" do
  #   get utbk_scores_show_url
  #   assert_response :success
  # end
end
