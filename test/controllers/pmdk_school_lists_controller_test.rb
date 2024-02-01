# frozen_string_literal: true

require 'test_helper'

class PmdkSchoolListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {
      session: { email: users(:adminuser).email, password: 'password' }
    }
    @pmdk_school_list = pmdk_school_lists(:one)
  end

  test 'should get index' do
    get pmdk_school_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_pmdk_school_list_url
    assert_response :success
  end

  test 'should create pmdk_school_list' do
    assert_difference('PmdkSchoolList.count') do
      post pmdk_school_lists_url, params: { pmdk_school_list: { sekolah: 'sma 1 bangsa' } }
    end

    assert_redirected_to pmdk_school_list_url(PmdkSchoolList.last)
  end

  test 'should show pmdk_school_list' do
    get pmdk_school_list_url(@pmdk_school_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_pmdk_school_list_url(@pmdk_school_list)
    assert_response :success
  end

  test 'should update pmdk_school_list' do
    patch pmdk_school_list_url(@pmdk_school_list),
          params: { pmdk_school_list: { sekolah: 'smk 1 tarutung' } }
    assert_redirected_to pmdk_school_list_url(@pmdk_school_list)
  end

  test 'should destroy pmdk_school_list' do
    assert_difference('PmdkSchoolList.count', -1) do
      delete pmdk_school_list_url(@pmdk_school_list)
    end

    assert_redirected_to pmdk_school_lists_url
  end
end
