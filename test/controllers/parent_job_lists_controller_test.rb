# frozen_string_literal: true

require 'test_helper'

class ParentJobListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:adminuser).email, password: 'password'
    } }
    @parent_job_list = parent_job_lists(:one)
  end

  test 'should get index' do
    get parent_job_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_parent_job_list_url
    assert_response :success
  end

  test 'should create parent_job_list' do
    assert_difference('ParentJobList.count') do
      post parent_job_lists_url, params: { parent_job_list: { pekerjaan: 'petani padi' } }
    end

    assert_redirected_to parent_job_list_url(ParentJobList.last)
  end

  test 'should show parent_job_list' do
    get parent_job_list_url(@parent_job_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_parent_job_list_url(@parent_job_list)
    assert_response :success
  end

  test 'should update parent_job_list' do
    patch parent_job_list_url(@parent_job_list), params: { parent_job_list: { pekerjaan: @parent_job_list.pekerjaan } }
    assert_redirected_to parent_job_list_url(@parent_job_list)
  end

  test 'should destroy parent_job_list' do
    assert_difference('ParentJobList.count', -1) do
      delete parent_job_list_url(@parent_job_list)
    end

    assert_redirected_to parent_job_lists_url
  end
end
