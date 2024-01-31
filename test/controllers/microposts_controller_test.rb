require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:orange)
  end
  test 'should redirect create when not logged in' do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {content: 'Lorem ipsum'}}
    end
    assert_redirected_to login_url
  end
  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
  test 'should redirect destroy for wrong micropost' do
    get login_path
    @user = users(:michael)
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end
  test 'should change the data when removed' do
    get login_path
    @user = users(:michael)
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    micropost = microposts(:orange)
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(micropost)
    end
    assert assert_redirected_to root_url
  end
end
