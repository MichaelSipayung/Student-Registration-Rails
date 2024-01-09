require "test_helper"

class UserTest < ActiveSupport::TestCase
  #test for validates user input
  #special method for setup the test
  def setup
    @user = User.new(name: "Example user", email: "user_#{Time.now.to_f}@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  #test case for valid input
  test "should be valid" do
    assert @user.valid?
  end
  #test for name should be present
  test "name should be present" do
    @user.name=" "
    assert_not @user.valid?
  end
  #test for email should be present
  test "email should be present" do
    @user.email =" "
    assert_not @user.valid?
  end
  #test for name should be less than 51
  test "name should not too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end
  #test for email should be less than 100
  test "email should not too long" do
    @user.email = "a"*90+"@example.com"
    assert_not @user.valid?
  end
  #test for valid email address
  test "email should be valid address" do
    @user.email="jack.com"
    assert_not @user.valid?
  end
  #test for unique email address
  test "email should be unique" do
    @user.name = "michaelsipayung"
    @user.email = "michaelsipayung123@gmail.com"
    duplicate_user = @user.dup #duplicate user
    duplicate_user.email  = @user.email.upcase #change the email to uppercase
    @user.save #save the user
    assert_not duplicate_user.valid?
  end
  #test for password should be present
  test "password should be present" do
    @user.password = @user.password_confirmation=" "*6
    assert_not @user.valid?
  end
  #test for password should be more than 5
  test "password should be more than 5" do
    @user.password = @user.password_confirmation="a"*5
    assert_not @user.valid?
  end
  #dealing with two different browser while in one browser already logout
  #but in the other browser not already logout, bugs
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember,'') #new version of auth?
  end
end
