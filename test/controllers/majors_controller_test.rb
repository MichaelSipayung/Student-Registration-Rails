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

  test 'should reject to get new major for filled data' do
    @user = users(:michael)
    get login_path
    post login_path, params: { session: {
      email: @user.email, password: 'password'
    } }
    get new_major_path
    assert_response :redirect
  end

  test 'should reject to send post request for filled major' do
    @user = users(:michael)
    get login_path
    post login_path, params: { session: {
      email: @user.email, password: 'password'
    } }
    post majors_path, params: {
      major: {
        jurusan1: 'teknik jaringan',
        jurusan2: 'teknik komputer',
        jurusan3: 'sistem',
        gelombang: 'pmdk lama'
      }
    }
    assert_response :redirect
  end
end
