require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:archer).email, password: 'password'}}
  end
  test 'should get new' do
    get new_address_path
    assert_response :success
  end

  test 'should get edit' do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_address_path(addresses(:addresscurr))
    assert_response :success
  end

end
