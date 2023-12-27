require "test_helper"

class UserTest < ActiveSupport::TestCase
  #test for validates user input
  #special method for setup the test
  def setup
    @user = User.new(name: "Example user", email: "example@user.com")
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
end
