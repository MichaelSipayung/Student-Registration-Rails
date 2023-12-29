require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end
  #test for redirect to home page after create new user

  #test for render new page after create new user with invalid input
end
