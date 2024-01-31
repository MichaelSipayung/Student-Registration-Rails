# frozen_string_literal: true

require 'test_helper'

class PmdkSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
  end
  test 'should get new' do
    get new_pmdk_school_information_path
    assert_response :success
  end

  test 'should update current pmdk school information' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert logged_in?
    get edit_pmdk_school_information_path(pmdk_school_informations(:pmdk_sc_one))
    assert_response :success
    patch pmdk_school_information_path(pmdk_school_informations(:pmdk_sc_one)),
          params: { pmdk_school_information: {
            asal_sekolah: 'sma juanda timur',
            akreditas: 'Unggul',
            jumlah_nilai_un: 90.78,
            jumlah_pelajaran_un: 9
          } }
    assert_equal 'sma juanda timur', pmdk_school_informations(:pmdk_sc_one).reload.asal_sekolah
    assert_equal 'Unggul', pmdk_school_informations(:pmdk_sc_one).reload.akreditas
    assert_equal 90.78, pmdk_school_informations(:pmdk_sc_one).reload.jumlah_nilai_un
    assert_equal 9, pmdk_school_informations(:pmdk_sc_one).reload.jumlah_pelajaran_un
  end
  test 'should reject to update pmdk school information for invalid data' do
    get login_path
    post login_path, params: { session: {
      email: users(:iana).email, password: 'password'
    } }
    assert logged_in?
    get edit_pmdk_school_information_path(pmdk_school_informations(:pmdk_sc_two))
    assert_response :success
    patch pmdk_school_information_path(pmdk_school_informations(:pmdk_sc_two)),
          params: { pmdk_school_information: {
            asal_sekolah: 'sma juanda timur',
            akreditas: 'Unggul',
            jumlah_nilai_un: 90.78,
            jumlah_pelajaran_un: 0
          } }
    assert_not_equal 0, pmdk_school_informations(:pmdk_sc_two).reload.jumlah_pelajaran_un
  end
  test 'should create new pmdk school information' do
    get new_pmdk_school_information_path
    assert_response :success
    assert_difference 'PmdkSchoolInformation.count' do
      post pmdk_school_informations_path, params: {
        pmdk_school_information: {
          jurusan_sekolah: 'slta',
          asal_sekolah: 'sma juanda timur',
          akreditas: 'Unggul',
          jumlah_nilai_un: 90.78,
          jumlah_pelajaran_un: 9
        }
      }
    end
    assert_not_nil PmdkSchoolInformation.find_by_asal_sekolah 'sma juanda timur'
    assert_not_nil PmdkSchoolInformation.find_by_akreditas 'Unggul'
    assert_not_nil PmdkSchoolInformation.find_by_jumlah_nilai_un 90.78
    assert_not_nil PmdkSchoolInformation.find_by_jumlah_pelajaran_un 9
  end
  test 'should reject for non permited params-pmdk school' do
    get new_pmdk_school_information_path
    assert_response :success
    assert_difference 'PmdkSchoolInformation.count' do
      post pmdk_school_informations_path, params: {
        pmdk_school_information: {
          jurusan_sekolah: 'smk taruna',
          asal_sekolah: 'sma juanda timur',
          akreditas: 'Unggul',
          jumlah_nilai_un: 90.78,
          jumlah_pelajaran_un: 9,
          user_id: 90_900_099
        }
      }
    end
    assert_nil PmdkSchoolInformation.find_by_user_id 90_900_099
  end
  test 'should reject for invalid information-pmdk school' do
    get new_pmdk_school_information_path
    assert_response :success
    assert_no_difference 'PmdkSchoolInformation.count' do
      post pmdk_school_informations_path, params: {
        pmdk_school_information: {
          asal_sekolah: 'sma juanda timur',
          akreditas: 'Unggul',
          jumlah_nilai_un: 90.78,
          jumlah_pelajaran_un: 0
        }
      }
    end
    assert_nil PmdkSchoolInformation.find_by_jumlah_nilai_un 90.78
  end
  test 'should get edit pmdk school information' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert logged_in?
    get edit_pmdk_school_information_path(pmdk_school_informations(:pmdk_sc_one))
    assert_response :success
  end
  test 'should reject for non permited params during update' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_school_information_path(pmdk_school_informations(:pmdk_sc_one))
    assert_response :success
    patch pmdk_school_information_path(pmdk_school_informations(:pmdk_sc_one)),
          params: { pmdk_school_information: {
            asal_sekolah: 'sma juanda timur',
            akreditas: 'Unggul',
            jumlah_nilai_un: 90.78,
            jumlah_pelajaran_un: 9,
            user_id: 90_900_091
          } }
    assert_not_equal 90_900_091, pmdk_school_informations(:pmdk_sc_one).reload.user_id
  end
  #
  # test "should get show" do
  #   get pmdk_school_informations_show_url
  #   assert_response :success
  # end
end
