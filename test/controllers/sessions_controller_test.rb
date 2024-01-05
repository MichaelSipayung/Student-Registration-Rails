require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:michael)
  end
  test "should get new" do #test for get login page
    get login_path
    assert_response :success
  end
  test "should get create" do #test for create new session
    get login_path
    assert_response :success
    post login_path, params: {session: {email:"michaelsipayung123@gmails.com", password: "foobar" }}
    assert_response :success
  end
end
