require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  #setup method is automatically run before every test
  def setup
    @user = User.new(name: "Example user", email: "user_#{Time.now.to_f}@example.com",
                     password: "foobar", password_confirmation: "foobar")
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
    assert @user.valid?
    assert @user.save
    puts @user
    get login_path
    assert_template 'sessions/new' #check the login page
    post login_path, params: {session:{email: @user.email,password: @user.password}}
    assert_redirected_to @user #check the redirect to user page
  end
end
