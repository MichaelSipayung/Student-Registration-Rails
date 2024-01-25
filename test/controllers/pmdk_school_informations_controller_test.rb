require "test_helper"

class PmdkSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pmdk_school_informations_new_url
    assert_response :success
  end

  test "should get update" do
    get pmdk_school_informations_update_url
    assert_response :success
  end

  test "should get create" do
    get pmdk_school_informations_create_url
    assert_response :success
  end

  test "should get edit" do
    get pmdk_school_informations_edit_url
    assert_response :success
  end

  test "should get show" do
    get pmdk_school_informations_show_url
    assert_response :success
  end
end
