# frozen_string_literal: true

require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: {
      email: users(:iana).email, password: 'password'
    } }
  end
  test 'should get new' do
    get new_source_path
    assert_response :success
  end

  test 'should get edit' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    get edit_source_path(sources(:one))
    assert_response :success
  end

  test 'should reject to get new source for exist source' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    get new_source_url
    assert_response :redirect
  end

  test 'should reject to send post request for exist source' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    post sources_path, params: {
      source: {
        jumlah_n: 13, sumber_informasi: 'internet', motivasi: 'keluarga'
      }
    }
    assert_response :redirect
  end
end
