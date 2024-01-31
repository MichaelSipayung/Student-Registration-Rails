# frozen_string_literal: true

require 'test_helper'

class UtbkSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {
      session: { email: users(:michael).email, password: 'password' }
    }
  end
  test 'should get new - utbk school information' do
    get new_utbk_school_information_path
    assert_response :success
  end

  test 'should  update - utbk school information' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert is_logged_in?
    get edit_utbk_school_information_url(utbk_school_informations(:utbk_sc_one))
    assert_response :success
    patch utbk_school_information_path(utbk_school_informations(:utbk_sc_one)), params: {
      utbk_school_information: {
        asal_sekolah: 'sma 2 balige', jumlah_pelajaran_un: 3,
        jumlah_nilai_un: 200.5, akreditas: 'Baik sekali'
      }
    }
    assert_equal 'sma 2 balige', utbk_school_informations(:utbk_sc_one).reload.asal_sekolah
    assert_equal 'Baik sekali', utbk_school_informations(:utbk_sc_one).reload.akreditas
    assert_equal  3, utbk_school_informations(:utbk_sc_one).reload.jumlah_pelajaran_un
    assert_equal  200.5, utbk_school_informations(:utbk_sc_one).reload.jumlah_nilai_un
  end
  test 'should reject update non permited params-utbk school' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert is_logged_in?
    get edit_utbk_school_information_url(utbk_school_informations(:utbk_sc_one))
    assert_response :success
    patch utbk_school_information_path(utbk_school_informations(:utbk_sc_one)), params: {
      utbk_school_information: {
        asal_sekolah: 'sma 2 balige', jumlah_pelajaran_un: 3,
        jumlah_nilai_un: 200.5, akreditas: 'Baik sekali', user_id: 98_777_908
      }
    }
    assert_not_equal 98_777_908, utbk_school_informations(:utbk_sc_one).reload.user_id
  end
  test 'should reject update the utbk school for invalid information' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert is_logged_in?
    get edit_utbk_school_information_url(utbk_school_informations(:utbk_sc_one))
    assert_response :success
    patch utbk_school_information_path(utbk_school_informations(:utbk_sc_one)), params: {
      utbk_school_information: {
        asal_sekolah: 'sma 9 balige', jumlah_pelajaran_un: 3,
        jumlah_nilai_un: 200.5, akreditas: ' '
      }
    }
    assert_not_equal 'sma 9 balige', utbk_school_informations(:utbk_sc_one).reload.user_id
  end
  test 'should create utbk school information' do
    get new_utbk_school_information_path
    assert_response :success
    assert_difference 'UtbkSchoolInformation.count' do
      post utbk_school_informations_path, params: {
        utbk_school_information: {
          asal_sekolah: 'sma 2 tarutung', jumlah_pelajaran_un: 9,
          jumlah_nilai_un: 100.5, akreditas: 'Baik', jurusan_sekolah: 'ipa'
        }
      }
    end
    assert_not_nil UtbkSchoolInformation.find_by_asal_sekolah 'sma 2 tarutung'
    assert_not_nil UtbkSchoolInformation.find_by_akreditas 'Baik'
    assert_not_nil UtbkSchoolInformation.find_by_jumlah_pelajaran_un 9
    assert_not_nil UtbkSchoolInformation.find_by_jumlah_nilai_un 100.5
  end
  test 'should reject to create - utbk school information' do
    get new_utbk_school_information_path
    assert_response :success
    assert_no_difference 'UtbkSchoolInformation.count' do
      post utbk_school_informations_path, params: {
        utbk_school_information: {
          jurusan_sekolah: 'smu tunas',
          asal_sekolah: 'sm', jumlah_pelajaran_un: 9,
          jumlah_nilai_un: 100.5, akreditas: 'Baik'
        }
      }
    end
    assert_nil UtbkSchoolInformation.find_by_asal_sekolah 'sm'
  end
  test 'should reject to create non permited params-utbk school' do
    get new_utbk_school_information_path
    assert_response :success
    assert_difference 'UtbkSchoolInformation.count' do
      post utbk_school_informations_path, params: {
        utbk_school_information: {
          jurusan_sekolah: 'smk teknik',
          asal_sekolah: 'sma 1 nauli', jumlah_pelajaran_un: 9,
          jumlah_nilai_un: 100.5, akreditas: 'Baik', user_id: 98_978
        }
      }
    end
    assert_nil UtbkSchoolInformation.find_by_user_id 98_978
  end
  test 'should get edit - utbk school information' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_utbk_school_information_url(utbk_school_informations(:utbk_sc_one))
    assert_response :success
  end

  # test "should get show" do
  #   get utbk_school_informations_show_url
  #   assert_response :success
  # end
end
