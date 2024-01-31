# frozen_string_literal: true

require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
  end
  test 'should get new' do
    get new_organization_path
    assert_response :success
  end
  test 'should get edit' do
    assert logged_in?
    get edit_organization_path(organizations(:one))
    assert_response :success
  end
end
