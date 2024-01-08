require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user  = users(:michael)
    @non_admin = users(:archer)
  end
  test "index including pagination" do
    get login_path
    post login_path, params:{session: {email: @user.email, password: 'password'}}
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
  test "index as non admin" do
    get login_path
    post login_path, params: {session: {email: @non_admin.email, password: 'password'}}
    get users_path
    assert_select 'a', text: 'delete', count: 0 #test if non-admin have no link for delete
  end
  test 'index as admin' do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    assert_select 'a[href=?]', user_path(@user), text: 'delete', count: 0
  end
end
