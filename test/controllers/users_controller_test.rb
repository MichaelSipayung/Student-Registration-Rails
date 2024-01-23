require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user  = users(:tempdona)
  end
  #test redirect for edit before logged in
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert assert_redirected_to login_url
  end
  #test redirect for update before logged in
  test "should redirect update when not logged in" do
    patch user_path(@user), params:
      {user: {name: @user.name, email: @user.email, password: 'password', password_confirmation: 'password'}}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should get new" do
    get signup_path
    assert_response :success
  end
  #if credentials is invalid allowed not to edit
  test "should redirect edit when logged in as wrong user" do
    get login_path
    post login_path, params: {session: {email: @other_user.email, password: 'password'}}
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url #should redirect to root since it's invalid credential
  end
  #if credentials is invalid allow not to update
  test "should redirect update when logged in as wrong user" do
    get login_path
    post login_path, params: {session: {email: @other_user.email, password: 'password'}}
    patch user_path(@user), params: {user: {name: 'janes', email: 'jane@gmail.com',
                                     password: 'password1', password_confirmation: 'password1'}}
    assert flash.empty?
    assert_redirected_to root_url
  end
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do #ensure no user deleted
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end
  test 'should redirect destroy when logged in as a non-admin' do
    get login_path
    post login_path, params: {session: {email: @other_user.email, password: 'password'}}
    assert_no_difference 'User.count' do #ensure no user delete
      delete user_path(@user) #try to delete, but i am not admin?
    end
    assert_redirected_to root_url
  end
  test "should redirect destroy when logged in as admin" do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    assert_difference 'User.count', -1 do
      delete user_path(@other_user)
    end
    assert_redirected_to users_url
  end
  test "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to  login_url
  end
  test "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end

end
