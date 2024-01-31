# frozen_string_literal: true

require 'test_helper'

class MajorsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
    get login_path
    post login_path, params: { session: {
      email: @user.email, password: 'password'
    } }
  end
  test 'should get new' do
    get new_major_path
    assert_response :success
  end
  test 'should get edit' do
    @user = users(:michael)
    get login_path
    post login_path, params: { session: {
      email: @user.email, password: 'password'
    } }
    get edit_major_path majors(:two)
    assert_response :success
  end
end
