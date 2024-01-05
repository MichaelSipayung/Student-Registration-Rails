require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael) #get from testing db, fixtures users
  end
  test "unsuccessful edit user data" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {user: {name: "", email: "invalid@mail",
                                            password: "foo", password_confirmation: "foos"}}
    assert_template 'users/edit'
  end
  test "success edit user data" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {user: {name: "michael john", email: "michaeljohn123@gmail.com",
                                            password: "1234567", password_confirmation: "1234567"}}
    follow_redirect!
    assert_template 'users/show' #make sure it's follow redirect to user page
    @user.reload #reload after update to make sure it's changed
    assert_equal "michael john", @user.name
    assert_equal "michaeljohn123@gmail.com", @user.email
  end
end
