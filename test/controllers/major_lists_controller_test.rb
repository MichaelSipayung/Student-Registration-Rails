# frozen_string_literal: true

require 'test_helper'

class MajorListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:adminuser).email, password: 'password'
    } }
    @major_list = major_lists(:one)
  end

  test 'should get index' do
    get major_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_major_list_url
    assert_response :success
  end

  test 'should create major_list' do
    assert_difference('MajorList.count') do
      post major_lists_url, params: { major_list: { jurusan: 'teknik air tanah' } }
    end

    assert_redirected_to major_list_url(MajorList.last)
  end

  test 'should show major_list' do
    get major_list_url(@major_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_major_list_url(@major_list)
    assert_response :success
  end

  test 'should update major_list' do
    patch major_list_url(@major_list), params: { major_list: { jurusan: @major_list.jurusan } }
    assert_redirected_to major_list_url(@major_list)
  end

  test 'should destroy major_list' do
    assert_difference('MajorList.count', -1) do
      delete major_list_url(@major_list)
    end

    assert_redirected_to major_lists_url
  end
end
