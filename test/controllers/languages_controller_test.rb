require "test_helper"

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:archer).email, password: 'password'}}
  end
  test 'should get new' do
    get new_language_path
    assert_response :success
  end

  test 'should get edit' do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_language_path(languages(:bahasa))
    assert_response :success
  end

end
