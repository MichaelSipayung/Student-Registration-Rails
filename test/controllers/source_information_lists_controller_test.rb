# frozen_string_literal: true

require 'test_helper'

class SourceInformationListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:adminuser).email, password: 'password'
    } }
    @source_information_list = source_information_lists(:one)
  end

  test 'should get index' do
    get source_information_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_source_information_list_url
    assert_response :success
  end

  test 'should create source_information_list' do
    assert_difference('SourceInformationList.count') do
      post source_information_lists_url,
           params: { source_information_list: { informasi: 'radio' } }
    end

    assert_redirected_to source_information_list_url(SourceInformationList.last)
  end

  test 'should show source_information_list' do
    get source_information_list_url(@source_information_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_source_information_list_url(@source_information_list)
    assert_response :success
  end

  test 'should update source_information_list' do
    patch source_information_list_url(@source_information_list),
          params: { source_information_list: { informasi: 'promosi' } }
    assert_redirected_to source_information_list_url(@source_information_list)
  end

  test 'should destroy source_information_list' do
    assert_difference('SourceInformationList.count', -1) do
      delete source_information_list_url(@source_information_list)
    end

    assert_redirected_to source_information_lists_url
  end
end
