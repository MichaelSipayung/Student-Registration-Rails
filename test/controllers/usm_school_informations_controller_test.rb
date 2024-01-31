require "test_helper"

class UsmSchoolInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
  end
  test 'should get new usm school information' do
    assert is_logged_in?
    get new_usm_school_information_url
    assert_response :success
  end

  test 'should get edit usm school information' do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    assert is_logged_in?
    get edit_usm_school_information_url(usm_school_informations(:usm_one))
    assert_response :success
  end
  test 'should create usm school information' do
    get new_usm_school_information_url
    assert_response :success
    assert_difference 'UsmSchoolInformation.count' do
      post usm_school_informations_path, params: {
        usm_school_information: {
          jurusan_sekolah: 'ipa MA', asal_sekolah: 'sma santo tomas 2', akreditas: 'terakreditasi',
          jumlah_pelajaran_semester_5: 15, jumlah_nilai_semester_5: 799.9
        }
      }
    end
    assert_equal 'usm school information is saved', flash[:success]
    assert_not_nil UsmSchoolInformation.find_by_jurusan_sekolah 'ipa MA'
    assert_not_nil UsmSchoolInformation.find_by_asal_sekolah 'sma santo tomas 2'
    assert_not_nil UsmSchoolInformation.find_by_jumlah_pelajaran_semester_5 15
    assert_not_nil  UsmSchoolInformation.find_by_jumlah_nilai_semester_5 799.9
  end
  test 'should reject for invalid usm school information' do
    get new_usm_school_information_url
    assert_response :success
    assert_no_difference 'UsmSchoolInformation.count' do
      post usm_school_informations_path, params: {
        usm_school_information: {
          jurusan_sekolah: 'ipa MA', asal_sekolah: 'sma santo tomas 2', akreditas: 'terakreditasi',
          jumlah_pelajaran_semester_5: 15, jumlah_nilai_semester_5: 0
        }
      }
    end
  end
  test 'should create usm school information but reject non permited params' do
    get new_usm_school_information_url
    assert_response :success
    assert_difference 'UsmSchoolInformation.count' do
      post usm_school_informations_path, params: {
        usm_school_information: {
          jurusan_sekolah: 'ipa MA', asal_sekolah: 'sma santo tomas 2', akreditas: 'terakreditasi',
          jumlah_pelajaran_semester_5: 15, jumlah_nilai_semester_5: 799.9, user_id: 87999822
        }
      }
    end
    assert_nil UsmSchoolInformation.find_by_user_id 87999822
  end
  test 'should update the usm school information' do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    assert is_logged_in?
    get edit_usm_school_information_url(usm_school_informations(:usm_one))
    assert_response :success
    patch usm_school_information_path(usm_school_informations(:usm_one)), params: {
      usm_school_information: {
        jurusan_sekolah: 'ipa MA', asal_sekolah: 'sma santo tomas 2', akreditas: 'terakreditasi',
        jumlah_pelajaran_semester_5: 15, jumlah_nilai_semester_5: 799.9
      }
    }
    assert_equal 'usm school information is updated', flash[:success]
    usm_school_informations(:usm_one).reload
    assert_equal 'ipa MA', usm_school_informations(:usm_one).reload.jurusan_sekolah
    assert_equal 'sma santo tomas 2', usm_school_informations(:usm_one).asal_sekolah
    assert_equal 'terakreditasi', usm_school_informations(:usm_one).akreditas
    assert_equal 15, usm_school_informations(:usm_one).jumlah_pelajaran_semester_5
    assert_equal 799.9, usm_school_informations(:usm_one).jumlah_nilai_semester_5
  end
  test 'should reject non permited params during update usm school information' do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    assert is_logged_in?
    get edit_usm_school_information_url(usm_school_informations(:usm_one))
    assert_response :success
    patch usm_school_information_path(usm_school_informations(:usm_one)), params: {
      usm_school_information: {
        jurusan_sekolah: 'ipa MA', asal_sekolah: 'sma santo tomas 2', akreditas: 'terakreditasi',
        jumlah_pelajaran_semester_5: 15, jumlah_nilai_semester_5: 799.9, user_id: 9990998
      }
    }
    usm_school_informations(:usm_one).reload
    assert_not_equal 9990998, usm_school_informations(:usm_one).user_id
  end
  test 'should reject to update usm school information for invalid data' do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    assert is_logged_in?
    get edit_usm_school_information_url(usm_school_informations(:usm_one))
    assert_response :success
    patch usm_school_information_path(usm_school_informations(:usm_one)), params: {
      usm_school_information: {
        jurusan_sekolah: 'ipa MA', asal_sekolah: 'sm', akreditas: 'terakreditasi',
        jumlah_pelajaran_semester_5: 15, jumlah_nilai_semester_5: 799.9
      }
    }
    assert_not_equal 'sm', usm_school_informations(:usm_one).reload.asal_sekolah
  end
end
