require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  #test for invalid signup information
  test "invalid signup information" do
    get signup_path
    assert_response :success
    #check the user count before and after the post
    assert_no_difference 'User.count' do
      post users_path, params:{user: {name:"", email: "user@invalid",
                    password: "foo", password_confirmation: "bar"}}
    end
    assert_template 'users/new'
  end
  #test for valid signup information
  test "valid signup information" do
    get signup_path
    assert_response :success
    #check the user count before and after the post
    assert_difference 'User.count',1 do
      post users_path, params: {user: {name: "michaelsipayung", email: "michael@hotmail.com",
                                        password: "foobar", password_confirmation: "foobar"}}
    end
    follow_redirect!
    #assert_template 'users/show'
    #test if it already logged in
    #assert is_logged_in?
  end
end
