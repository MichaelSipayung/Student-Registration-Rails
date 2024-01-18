require "test_helper"

class PersonalControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: { email:    users(:michael).email, password: 'password' } }
  end
  test "should get new" do
    get new_personal_path
    assert_response :success
  end
  test "should get edit" do
    get edit_personal_path(personals(:one))
    assert_response :success
  end

end
