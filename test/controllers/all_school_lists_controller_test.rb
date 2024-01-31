# frozen_string_literal: true

require 'test_helper'

class AllSchoolListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
    @all_school_list = all_school_lists(:one)
  end

  test 'should get index' do
    get all_school_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_all_school_list_url
    assert_response :success
  end

  test 'should create all_school_list' do
    assert_difference('AllSchoolList.count') do
      post all_school_lists_url, params: { all_school_list: { sekolah: 'sma bina nusantara' } }
    end

    assert_redirected_to all_school_list_url(AllSchoolList.last)
  end

  test 'should show all_school_list' do
    get all_school_list_url(@all_school_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_all_school_list_url(@all_school_list)
    assert_response :success
  end

  test 'should update all_school_list' do
    patch all_school_list_url(@all_school_list),
          params: { all_school_list: { sekolah: 'sma taruna nusantara' } }
    assert_redirected_to all_school_list_url(@all_school_list)
  end

  test 'should destroy all_school_list' do
    assert_difference('AllSchoolList.count', -1) do
      delete all_school_list_url(@all_school_list)
    end

    assert_redirected_to all_school_lists_url
  end
end
