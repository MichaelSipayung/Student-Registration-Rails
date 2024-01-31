# frozen_string_literal: true

require 'test_helper'

class ExtrasControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
  end
  test 'should get new' do
    get new_extra_path
    assert_response :success
  end
  test 'should get edit' do
    get edit_extra_path(extras(:first_extra))
    assert_response :success
  end
end
