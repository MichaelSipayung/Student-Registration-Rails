# frozen_string_literal: true

require 'test_helper'

class PersonalGenderListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
    @personal_gender_list = personal_gender_lists(:one)
  end

  test 'should get index' do
    get personal_gender_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_personal_gender_list_url
    assert_response :success
  end

  test 'should create personal_gender_list' do
    assert_difference('PersonalGenderList.count') do
      post personal_gender_lists_url, params: { personal_gender_list: { jenis_kelamin: 'perempuan' } }
    end

    assert_redirected_to personal_gender_list_url(PersonalGenderList.last)
  end

  test 'should show personal_gender_list' do
    get personal_gender_list_url(@personal_gender_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_personal_gender_list_url(@personal_gender_list)
    assert_response :success
  end

  test 'should update personal_gender_list' do
    patch personal_gender_list_url(@personal_gender_list),
          params: { personal_gender_list: { jenis_kelamin: 'pria' } }
    assert_redirected_to personal_gender_list_url(@personal_gender_list)
  end

  test 'should destroy personal_gender_list' do
    assert_difference('PersonalGenderList.count', -1) do
      delete personal_gender_list_url(@personal_gender_list)
    end

    assert_redirected_to personal_gender_lists_url
  end
end
