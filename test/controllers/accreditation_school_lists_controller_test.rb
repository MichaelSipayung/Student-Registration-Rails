# frozen_string_literal: true

require 'test_helper'

class AccreditationSchoolListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:adminuser).email, password: 'password'
    } }
    @accreditation_school_list = accreditation_school_lists(:one)
  end

  test 'should get index' do
    get accreditation_school_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_accreditation_school_list_url
    assert_response :success
  end

  test 'should create accreditation_school_list' do
    assert_difference('AccreditationSchoolList.count') do
      post accreditation_school_lists_url,
           params: { accreditation_school_list: { akreditasi: 'baik' } }
    end

    assert_redirected_to accreditation_school_list_url(AccreditationSchoolList.last)
  end

  test 'should show accreditation_school_list' do
    get accreditation_school_list_url(@accreditation_school_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_accreditation_school_list_url(@accreditation_school_list)
    assert_response :success
  end

  test 'should update accreditation_school_list' do
    patch accreditation_school_list_url(@accreditation_school_list),
          params: { accreditation_school_list: { akreditasi: 'terakreditasi' } }
    assert_redirected_to accreditation_school_list_url(@accreditation_school_list)
  end

  test 'should destroy accreditation_school_list' do
    assert_difference('AccreditationSchoolList.count', -1) do
      delete accreditation_school_list_url(@accreditation_school_list)
    end

    assert_redirected_to accreditation_school_lists_url
  end
end
