require "test_helper"
class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
  end
  test "password resets with invalid email" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    assert_select 'input[name=?]', 'password_reset[email]'
    #invalid email
    post password_resets_path, params: {password_reset: {email: ""}}
    assert_not flash.empty?
    assert_template 'password_resets/new'
  end
  test "password reset valid email" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    post password_resets_path, params: {password_reset: {email: @user.email}}
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  test "password reset inactive user" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    @user.activated  = false
    post password_resets_path, params: {password_reset: {email: @user.email}}
    get password_resets_edit_path(@user.reset_token, @user.email)
    assert_redirected_to root_url
  end
  test "password reset wrong email right token" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    post password_resets_path, params: {password_reset: {email: @user.email}}
    user  = assigns(:user)
    get password_resets_edit_path(user.reset_token, email: '')
    assert_redirected_to root_url
  end
  test "password reset right email and token" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    post password_resets_path, params: {password_reset: {email: @user.email}}
    @user.reload
    assert_redirected_to root_url
    user  = assigns(:user)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
  end
  test "password reset empty or wrong combination password" do
    get new_password_reset_path
    post password_resets_path, params: {password_reset: {email: @user.email}}
    user  = assigns(:user)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    patch password_reset_path(user.reset_token), params: {email: user.email, user: {
      password: "", password_confirmation: ""
    }}
    assert_template 'password_resets/edit'
    #invalid combination
    get edit_password_reset_path(user.reset_token, email: user.email)
    patch password_reset_path(user.reset_token), params: {email: user.email, user:
      {password: 'foobar1', password_confirmation: 'foobar'}}
    assert_template 'password_resets/edit'
  end
  test "password reset valid combination" do
    get new_password_reset_path
    post password_resets_path, params: {password_reset: {email: @user.email}}
    user = assigns(:user)
    get edit_password_reset_path(user.reset_token, email: user.email)
    #too short
    patch password_reset_path(user.reset_token), params: {email: user.email, user: {
      password: 'dummy', password_confirmation: 'dummy'
    }}
    assert_template 'password_resets/edit'
    #right combination
    get edit_password_reset_path(user.reset_token, email: user.email)
    patch password_reset_path(user.reset_token), params: {email: user.email, user: {
      password: 'dummy1', password_combination:  'dummy1'
    }}
    assert_redirected_to user
  end
  test "password reset expired token" do
    get new_password_reset_path
    post password_resets_path, params: {password_reset: {email: @user.email}}
    @user = assigns(:user)
    @user.update_attribute(:reset_sent_at, 3.hours.ago)
    patch password_reset_path(@user.reset_token), params: {email: @user.email, user: {
      password: 'foobars', password_confirmation: 'foobars'
    }}
    assert_response :redirect
  end
end
