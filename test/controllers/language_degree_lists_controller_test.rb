# frozen_string_literal: true

require 'test_helper'

class LanguageDegreeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email,
      password: 'password'
    } }
    @language_degree_list = language_degree_lists(:one)
  end

  test 'should get index' do
    get language_degree_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_language_degree_list_url
    assert_response :success
  end

  test 'should create language_degree_list' do
    assert_difference('LanguageDegreeList.count') do
      post language_degree_lists_url, params: { language_degree_list: { tingkat: @language_degree_list.tingkat } }
    end

    assert_redirected_to language_degree_list_url(LanguageDegreeList.last)
  end

  test 'should show language_degree_list' do
    get language_degree_list_url(@language_degree_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_language_degree_list_url(@language_degree_list)
    assert_response :success
  end

  test 'should update language_degree_list' do
    patch language_degree_list_url(@language_degree_list),
          params: { language_degree_list: { tingkat: @language_degree_list.tingkat } }
    assert_redirected_to language_degree_list_url(@language_degree_list)
  end

  test 'should destroy language_degree_list' do
    assert_difference('LanguageDegreeList.count', -1) do
      delete language_degree_list_url(@language_degree_list)
    end

    assert_redirected_to language_degree_lists_url
  end
end
