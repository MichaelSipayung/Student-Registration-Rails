# frozen_string_literal: true

require 'test_helper'
class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:michael)
    remember @user
  end
  test 'current user return right user when session is nil' do
    assert_equal @user, current_user
    assert logged_in?
  end
  test 'current user return nil when remember digest is wrong' do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end
