# frozen_string_literal: true

require 'test_helper'
def setup
  # deliveries array is global, so we need to setup
  # to make sure we must reset it, prevent from breaking
  # if any other test deliver email
  ActionMailer::Base.deliveries.clear
end

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test for invalid signup information
  test 'invalid signup information' do
    get signup_path
    assert_response :success
    # check the user count before and after the post
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'user@invalid',
                                         password: 'foo', password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
    assert_select 'div.field_with_errors'
  end
  # test for valid signup information
  test 'valid signup information' do
    get signup_path
    assert_response :success
    # check the user count before and after the post
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'michaelsipayung', email: 'michael@hotmail.com',
                                         password: 'foobar', password_confirmation: 'foobar' } }
    end
    follow_redirect!
    # assert_template 'users/show'
    # test if it already logged in
    # assert is_logged_in?
  end
  test 'valid signup information with account activation' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Example User',
                                         email: 'usermine@example.com',
                                         password: 'password',
                                         password_confirmation: 'password' } }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size # make sure is send
    # using assigns to lets us access instance variables in
    # the corresponding action, example in create action (controller user)
    # we have @user variable so we can access it
    user = assigns(:user)
    assert_not user.activated?
    # try login before activation
    get login_path
    post login_path, params: { session: { email: user.email, password: 'password' } }
    assert_not is_logged_in?
    # valid token wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # valid activation
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
