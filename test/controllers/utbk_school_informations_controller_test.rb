require "test_helper"

class UtbkSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get utbk_school_informations_new_url
    assert_response :success
  end

  test "should get update" do
    get utbk_school_informations_update_url
    assert_response :success
  end

  test "should get create" do
    get utbk_school_informations_create_url
    assert_response :success
  end

  test "should get edit" do
    get utbk_school_informations_edit_url
    assert_response :success
  end

  test "should get show" do
    get utbk_school_informations_show_url
    assert_response :success
  end
end
