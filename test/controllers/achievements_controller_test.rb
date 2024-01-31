# frozen_string_literal: true

require 'test_helper'

class AchievementsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
  end
  test 'should get new' do
    get new_achievement_path
    assert_response :success
  end

  test 'should get edit' do
    assert logged_in?
    puts users(:michael).inspect # This will print the michael user to the console
    get edit_achievement_path achievements(:first_achievement)
    assert_response :success
  end
end
