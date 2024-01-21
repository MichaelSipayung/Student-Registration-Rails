require "test_helper"

class SourcesControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {
      email: users(:iana).email, password: 'password'
    }}
  end
  test "should get new" do
    get new_source_path
    assert_response :success
  end

  test "should get edit" do
    get edit_source_path(users(:michael))
    assert_response :success
  end

end