# frozen_string_literal: true

require 'test_helper'

class PersonalControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: { email: users(:iana).email, password: 'password' } }
  end
  test 'should get new' do
    get new_personal_path
    assert_response :success
  end
  test 'should get edit' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    get edit_personal_path(personals(:one))
    assert_response :success
  end
  test 'reject to get new personal if it already filled' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    get new_personal_path
    assert_response :redirect
  end
  test 'reject to send post request if personal already filled' do
    get login_path
    post login_path, params: { session: { email: users(:michael).email, password: 'password' } }
    assert logged_in?
    post personals_path, params: { personal:
                                    { nama_lengkap: 'Michael januari', agama: 'Muslim',
                                      nik: '1234567890123456', nisn: '1234567890', no_kps: '123456',
                                      tanggal_lahir: '1999-12-12', tempat_lahir: 'Medan',
                                      jenis_kelamin: 'Laki-laki', domisili: 'Medan', user_id: 190_789 } }
    assert_response :redirect
  end
end
