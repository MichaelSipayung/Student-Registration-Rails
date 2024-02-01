# frozen_string_literal: true

require 'test_helper'

class PmdkTotalScoreInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
  end
  test 'should get new' do
    get new_pmdk_total_score_information_path
    assert_response :success
  end
  test 'should get edit' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert logged_in?
    get edit_pmdk_total_score_information_path(pmdk_total_score_informations(:pmdk_total_one))
    assert_response :success
  end
  test 'should create a new pmdk total score for the current user' do
    get new_pmdk_total_score_information_path
    assert_response :success
    assert_difference 'PmdkTotalScoreInformation.count' do
      post pmdk_total_score_informations_path, params: {
        pmdk_total_score_information: {
          jumlah_nilai_semester1: 120.5,
          jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
          jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
          jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
          jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
          jumlah_pelajaran_semester5: 14
        }
      }
    end
    assert_not_nil   PmdkTotalScoreInformation.find_by_jumlah_nilai_semester1 120.5
    assert_not_nil   PmdkTotalScoreInformation.find_by_jumlah_nilai_semester2 122.5
    assert_not_nil   PmdkTotalScoreInformation.find_by_jumlah_nilai_semester3 130.9
    assert_not_nil   PmdkTotalScoreInformation.find_by_jumlah_nilai_semester4 189.9
    assert_not_nil   PmdkTotalScoreInformation.find_by_jumlah_nilai_semester5 189.98

    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester1 3
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester2 6
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester3 12
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester4 15
    assert_not_nil PmdkTotalScoreInformation.find_by_jumlah_pelajaran_semester5 14
  end
  test 'should reject non permited params while create total pmdk score' do
    get new_pmdk_total_score_information_path
    assert_response :success
    assert_difference 'PmdkTotalScoreInformation.count' do
      post pmdk_total_score_informations_path, params: {
        pmdk_total_score_information: {
          jumlah_nilai_semester1: 120.5,
          jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
          jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
          jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
          jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
          jumlah_pelajaran_semester5: 14, user_id: 98_999_809
        }
      }
    end
    assert_nil PmdkTotalScoreInformation.find_by_user_id 98_999_809
  end
  test 'should reject to create pmdk total score for invalid information' do
    get new_pmdk_total_score_information_path
    assert_response :success
    assert_no_difference 'PmdkTotalScoreInformation.count' do
      post pmdk_total_score_informations_path, params: {
        pmdk_total_score_information: {
          jumlah_nilai_semester1: 0,
          jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
          jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
          jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
          jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
          jumlah_pelajaran_semester5: 14
        }
      }
    end
    assert_nil PmdkTotalScoreInformation.find_by_jumlah_nilai_semester1 0
    assert_nil PmdkTotalScoreInformation.find_by_jumlah_nilai_semester3 130.9
  end
  test 'should update pmdk total score information' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_total_score_information_path(pmdk_total_score_informations(:pmdk_total_one))
    assert_response :success
    patch pmdk_total_score_information_path(pmdk_total_score_informations(:pmdk_total_one)), params: {
      pmdk_total_score_information: {
        jumlah_nilai_semester1: 120.5,
        jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
        jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
        jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
        jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
        jumlah_pelajaran_semester5: 14
      }
    }
    pmdk_total_score_informations(:pmdk_total_one).reload
    assert_equal 120.5, pmdk_total_score_informations(:pmdk_total_one).jumlah_nilai_semester1
    assert_equal 122.5, pmdk_total_score_informations(:pmdk_total_one).jumlah_nilai_semester2
    assert_equal 130.9, pmdk_total_score_informations(:pmdk_total_one).jumlah_nilai_semester3
    assert_equal 189.9, pmdk_total_score_informations(:pmdk_total_one).jumlah_nilai_semester4
    assert_equal 189.98, pmdk_total_score_informations(:pmdk_total_one).jumlah_nilai_semester5
    assert_equal 3, pmdk_total_score_informations(:pmdk_total_one).jumlah_pelajaran_semester1
    assert_equal 6, pmdk_total_score_informations(:pmdk_total_one).jumlah_pelajaran_semester2
    assert_equal 12, pmdk_total_score_informations(:pmdk_total_one).jumlah_pelajaran_semester3
    assert_equal 15, pmdk_total_score_informations(:pmdk_total_one).jumlah_pelajaran_semester4
    assert_equal 14, pmdk_total_score_informations(:pmdk_total_one).jumlah_pelajaran_semester5
  end
  test 'should not update non-permited params for total score pmdk' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_total_score_information_path(pmdk_total_score_informations(:pmdk_total_one))
    assert_response :success
    patch pmdk_total_score_information_path(pmdk_total_score_informations(:pmdk_total_one)), params: {
      pmdk_total_score_information: {
        jumlah_nilai_semester1: 120.5,
        jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
        jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
        jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
        jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
        jumlah_pelajaran_semester5: 14, user_id: 9_888_898_910
      }
    }
    assert_not_equal 9_888_898_910, pmdk_total_score_informations(:pmdk_total_one).reload.user_id
  end
  test 'should not update for wrong information for total score pmdk' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_total_score_information_path(pmdk_total_score_informations(:pmdk_total_one))
    assert_response :success
    patch pmdk_total_score_information_path(pmdk_total_score_informations(:pmdk_total_one)), params: {
      pmdk_total_score_information: {
        jumlah_nilai_semester1: 120.5,
        jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
        jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
        jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
        jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
        jumlah_pelajaran_semester5: 0
      }
    }
    assert_not_equal 0, pmdk_total_score_informations(:pmdk_total_one).reload.jumlah_pelajaran_semester5
  end
  test 'should reject to send new request to exist pmdk total score' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert logged_in?
    get new_pmdk_total_score_information_url
    assert_response :redirect
  end
  test 'should reject to send post request for exist pmdk total score' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert logged_in?
    post pmdk_total_score_informations_path, params: {
      pmdk_total_score_information: {
        jumlah_nilai_semester1: 120.5,
        jumlah_nilai_semester2: 122.5, jumlah_nilai_semester3: 130.9,
        jumlah_nilai_semester4: 189.9, jumlah_nilai_semester5: 189.98,
        jumlah_pelajaran_semester1: 3, jumlah_pelajaran_semester2: 6,
        jumlah_pelajaran_semester3: 12, jumlah_pelajaran_semester4: 15,
        jumlah_pelajaran_semester5: 14, user_id: 98_999_809
      }
    }
    assert_response :redirect
  end
end
