# frozen_string_literal: true

require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'password' } }
  end
  # test "following page" do
  #   get following_user_path(@user)
  #   assert_not @user.following.empty?
  #   assert_match @user.following.count.to_s, response.body
  #   @user.following.each do |user|
  #     assert_select 'a[href=?]', user_path(user) #check if the link is correct
  #   end
  # end
  # test "followers page" do
  #   get followers_user_path(@user)
  #   assert_not @user.followers.empty?
  #   assert_match @user.followers.count.to_s, response.body #check if the link is correct
  #   @user.followers.each do |user|
  #     assert_select 'a[href=?]', user_path(user)
  #   end
  # end
end
