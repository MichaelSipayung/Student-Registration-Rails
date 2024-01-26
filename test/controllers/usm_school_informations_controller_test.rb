require "test_helper"

class UsmSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get usm_school_informations_new_url
    assert_response :success
  end

  test "should get update" do
    get usm_school_informations_update_url
    assert_response :success
  end

  test "should get create" do
    get usm_school_informations_create_url
    assert_response :success
  end

  test "should get edit" do
    get usm_school_informations_edit_url
    assert_response :success
  end

  test "should get show" do
    get usm_school_informations_show_url
    assert_response :success
  end
end
