require "test_helper"

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:michael)
  end
  test "micropost interface" do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    get root_path
    assert_select 'div.pagination'
    #invalid submission
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {content: ''}}
    end
    assert_select 'a[href=?]', '/?page=2'
    content =  "the micropost really ties room together"
    post microposts_path, params: {micropost: {content: content}}
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    assert_select 'a', text: 'Delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    #visit difference user, no delete link
    get user_path(users(:archer))
    assert_select 'a', text: 'Delete', count: 0
  end
end
