# frozen_string_literal: true

require 'test_helper'

class HighSchoolMajorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
    @high_school_major = high_school_majors(:one)
  end

  test 'should get index' do
    get high_school_majors_url
    assert_response :success
  end

  test 'should get new' do
    get new_high_school_major_url
    assert_response :success
  end

  test 'should create high_school_major' do
    assert_difference('HighSchoolMajor.count') do
      post high_school_majors_url, params: { high_school_major: { jurusan: 'smk teknik ringan' } }
    end

    assert_redirected_to high_school_major_url(HighSchoolMajor.last)
  end

  test 'should show high_school_major' do
    get high_school_major_url(@high_school_major)
    assert_response :success
  end

  test 'should get edit' do
    get edit_high_school_major_url(@high_school_major)
    assert_response :success
  end
  # test "should get edit without specify what to edit" do
  #   get edit_high_school_major_url
  #   assert_response :success
  # end
  test 'should update high_school_major' do
    patch high_school_major_url(@high_school_major),
          params: { high_school_major: { jurusan: @high_school_major.jurusan } }
    assert_redirected_to high_school_major_url(@high_school_major)
  end

  test 'should destroy high_school_major' do
    assert_difference('HighSchoolMajor.count', -1) do
      delete high_school_major_url(@high_school_major)
    end

    assert_redirected_to high_school_majors_url
  end
end
