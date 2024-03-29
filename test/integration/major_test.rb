# frozen_string_literal: true

require 'test_helper'

class MajorTestAll < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
  end
  test 'should create a new major' do
    get new_major_path
    assert_template 'majors/new'
    assert_difference 'Major.count' do
      post majors_path, params: { major: {
        jurusan1: 'fisika', jurusan2: 'biology', jurusan3: 'math',
        gelombang: 'pmdk sumut'
      } }
    end
    assert_not_nil Major.find_by_jurusan1 'fisika'
    assert_not_nil Major.find_by_jurusan2 'biology'
    assert_not_nil Major.find_by_jurusan3 'math'
    assert_not_nil Major.find_by_gelombang 'pmdk sumut'
  end
  test 'should not create major if one major equal to each other' do
    get new_major_path
    assert_template 'majors/new'
    assert_no_difference 'Major.count' do
      post majors_path, params: { major: {
        jurusan1: 'fisika 1', jurusan2: 'fisika 1', jurusan3: 'math',
        gelombang: 'pmdk sumut'
      } }
    end
    assert_nil Major.find_by_jurusan1 'fisika 1'
  end
  test 'should not create major for invalid information' do
    get new_major_path
    assert_template 'majors/new'
    assert_no_difference 'Major.count' do
      post majors_path, params: { major: {
        jurusan1: 'fisika 1', jurusan2: 'fisika 2', jurusan3: 'mat',
        gelombang: 'pmdk sumut'
      } }
    end
    assert_nil Major.find_by_jurusan1 'mat'
  end
  test 'should reject non param while create major' do
    get new_major_path
    assert_template 'majors/new'
    assert_difference 'Major.count' do
      post majors_path, params: { major: {
        jurusan1: 'fisika 1', jurusan2: 'fisika 2', jurusan3: 'math',
        gelombang: 'pmdk sumut', user_id: 90_989_098
      } }
    end
    assert_nil Major.find_by_user_id 90_989_098
  end
  test 'should update the major' do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
    get edit_major_path majors(:one)
    assert_template 'majors/edit'
    patch major_path(majors(:one)), params: { major: {
      jurusan1: 'fisika 1', jurusan2: 'fisika 2', jurusan3: 'math 1',
      gelombang: 'pmdk sumut baru'
    } }
    assert_equal 'fisika 1', majors(:one).reload.jurusan1
    assert_equal 'fisika 2', majors(:one).reload.jurusan2
    assert_equal 'math 1', majors(:one).reload.jurusan3
    assert_equal 'pmdk sumut baru', majors(:one).reload.gelombang
  end
  test 'should reject to update major' do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
    get edit_major_path majors(:one)
    assert_template 'majors/edit'
    patch major_path(majors(:one)), params: { major: {
      jurusan1: '1', jurusan2: '2', jurusan3: 'math 1',
      gelombang: 'pmdk sumut baru'
    } }
    assert_nil Major.find_by_jurusan1 '1'
    assert_nil Major.find_by_jurusan2 '2'
    assert_nil Major.find_by_jurusan3 'math 1'
  end
  test 'should reject to update for non permited params' do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
    get edit_major_path majors(:one)
    assert_template 'majors/edit'
    patch major_path(majors(:one)), params: { major: {
      jurusan1: 'fisika walker', jurusan2: 'fisika halidaty', jurusan3: 'math 1',
      gelombang: 'pmdk sumut baru', user_id: 19_800_089
    } }
    assert_nil Major.find_by_user_id 19_800_089
  end
end
