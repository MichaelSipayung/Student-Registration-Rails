# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path # make request to root_path and the controller is is under test
    # assert specific template, partial or layout which was rendered in a controller action
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2 # test for root link
    assert_select 'a[href=?]', help_path # test for help link
    assert_select 'a[href=?]', about_path # test for about link
    assert_select 'a[href=?]', contact_path # test for contact link
    assert_select 'a[href=?]', signup_path, count: 2 # test for signup link
  end
end
