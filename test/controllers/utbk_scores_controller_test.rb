require "test_helper"

class UtbkScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get utbk_scores_new_url
    assert_response :success
  end

  test "should get update" do
    get utbk_scores_update_url
    assert_response :success
  end

  test "should get create" do
    get utbk_scores_create_url
    assert_response :success
  end

  test "should get edit" do
    get utbk_scores_edit_url
    assert_response :success
  end

  test "should get show" do
    get utbk_scores_show_url
    assert_response :success
  end
end
