# frozen_string_literal: true

# reject access for non admin user
require 'test_helper'

class RejectNonAdminTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:adminuser)
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'password'}}
    assert logged_in?
  end
  test 'personal data reject for admin' do
    get new_personal_url
    assert_redirected_to root_url
  end
  test 'parents data reject for admin' do
    get new_parent_url
    assert_redirected_to root_url
  end
  test 'majors data reject for admin' do
    get new_major_url
    assert_redirected_to root_url
  end
  test 'organizations data reject for admin' do
    get new_organization_url
    assert_redirected_to root_url
  end
  test 'source data reject for admin' do
    get new_source_url
    assert_redirected_to root_url
  end
  test 'achievement data reject for admin' do
    get new_achievement_url
    assert_redirected_to root_url
  end
  test 'language data reject for admin' do
    get new_language_url
    assert_redirected_to root_url
  end
  test 'utbk_score data reject for admin' do
    get new_utbk_score_url
    assert_redirected_to root_url
  end
  test 'utbk school data reject for admin' do
    get new_utbk_school_information_url
    assert_redirected_to root_url
  end
  test 'usm school data reject for admin' do
    get new_usm_school_information_url
    assert_redirected_to root_url
  end
  test 'pmdk total data reject for admin' do
    get new_pmdk_total_score_information_url
    assert_redirected_to root_url
  end
  test 'pmdk school data reject for admin' do
    get new_pmdk_school_information_url
    assert_redirected_to root_url
  end
  test 'pmdk each score data reject for admin' do
    get new_pmdk_each_score_information_url
    assert_redirected_to root_url
  end
  test 'address data reject for admin' do
    get new_address_url
    assert_redirected_to root_url
  end
end
