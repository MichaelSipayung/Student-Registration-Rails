require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  #setup method is automatically run before every test
  # def setup
  #   @user = User.new(name: "Example user", email: "user_#{Time.now.to_f}@example.com",
  #                    password: "foobar", password_confirmation: "foobar")
  # end
  #other alternative for setup method using fixture
  def setup
    @user = users(:michael)
  end
  #test for invalid login information
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new' #check the login page
    post login_path, params: {session:{email:"",password:""}}
    assert_template 'sessions/new' #check the login page again
    #check the flash message is not empty
    assert_not flash.empty?
    get root_path #make sure the flash message doesn't appear on the next page
    assert flash.empty? #check the flash message is empty
  end
  #login with valid information
  test "login with valid information" do
    get login_path
    post login_path, params: {session:{email: @user.email, password: 'password'}}
    assert_redirected_to @user #check the redirect to the user page
    follow_redirect! #visit the target page
    assert_template 'users/show' #check the user page
    assert_select "a[href=?]", login_path, count: 0 #check the login link is not appear
    assert_select "a[href=?]", logout_path #check the logout link is appear
    assert_select "a[href=?]", user_path(@user) #check the user link is appear
  end
  #login with valid information followed by logout
  test "login followed by logout" do
    get login_path
    post login_path, params: {session: {email:@user.email,password: 'password'}}
    assert is_logged_in? #check the user is logged in
    #logout the user\
    delete logout_path
    assert_not is_logged_in? #check the user is logged out
    assert_redirected_to root_url #check the redirect to the root page
    #test logout again in other tab or window
    delete logout_path
    follow_redirect! #visit the target page
    #check the login link is appear
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0 #check the logout link is not appear
    assert_select "a[href=?]", user_path(@user), count: 0 #check the user link is not appear
  end
end
