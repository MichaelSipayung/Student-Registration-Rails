# frozen_string_literal: true

require 'test_helper'

class ParentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: { email: users(:archer).email, password: 'password' } }
  end
  test 'should get new' do
    assert logged_in?
    get new_parent_path
    assert_response :success
  end

  test 'should get edit' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    get edit_parent_path(parents(:myparent))
    assert_response :success
  end

  test 'should reject to get new if parent filled' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    get new_parent_path
    assert_response :redirect
  end

  test 'should reject to send post for parent who already filled' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    post parents_path, params: {
      parent: {
        nama_ayah: 'daniel', nama_ibu: 'nisa', nik_ayah: 1_234_567_890_121_345,
        nik_ibu: 1_234_567_890_123_415, pendidikan_ayah: 'sma', pendidikan_ibu: 'slta',
        tanggal_lahir_ayah: '2020-12-11', tanggal_lahir_ibu: '2013-12-10',
        pekerjaan_ayah: 'Tentara', pekerjaan_ibu: 'guru sd'
      }
    }
    assert_response :redirect
  end
end
