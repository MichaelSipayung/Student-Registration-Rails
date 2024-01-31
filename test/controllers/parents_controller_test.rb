require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:archer).email, password: 'password'}}
  end
  test 'should get new' do
    assert is_logged_in?
    get new_parent_path
    assert_response :success
  end

  test 'should get edit' do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    assert is_logged_in?
    get edit_parent_path(parents(:myparent))
    assert_response :success
  end
end
