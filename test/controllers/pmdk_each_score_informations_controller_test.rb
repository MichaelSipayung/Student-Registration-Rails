# frozen_string_literal: true

require 'test_helper'

class PmdkEachScoreInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
  end
  test 'should get new pmdk each score information' do
    get new_pmdk_each_score_information_path
    assert_response :success
  end
  test 'should get edit pmdk each score information' do
    assert logged_in?
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
  end
  test 'should create new pmdk each score information' do
    get new_pmdk_each_score_information_path
    assert_response :success
    assert_difference 'PmdkEachScoreInformation.count' do
      post pmdk_each_score_informations_path, params: { pmdk_each_score_information: {
        matematika_semester1: 90, matematika_semester2: 80,
        matematika_semester3: 89, matematika_semester4: 90.8,
        matematika5: 88.9, kimia1: 98.9,
        kimia2: 98.3, kimia3: 88.7,
        kimia4: 88.5, kimia5: 88.1,
        fisika1: 34.9, fisika2: 99.9,
        fisika3: 88.9, fisika4: 99.7,
        fisika5: 67.7, inggris1: 88.5,
        inggris2: 56.8, inggris3: 77.2,
        inggris4: 88.1, inggris5: 99.3
      } }
    end
    assert_not_nil PmdkEachScoreInformation.find_by_user_id users(:michael).id
    assert_not_nil PmdkEachScoreInformation.find_by_fisika1 34.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika2 99.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika3 88.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika4 99.7
    assert_not_nil PmdkEachScoreInformation.find_by_fisika5 67.7

    assert_not_nil PmdkEachScoreInformation.find_by_matematika_semester1 90
    assert_not_nil PmdkEachScoreInformation.find_by_matematika_semester2 80
    assert_not_nil  PmdkEachScoreInformation.find_by_matematika_semester3 89
    assert_not_nil  PmdkEachScoreInformation.find_by_matematika_semester4 90.8
    assert_not_nil  PmdkEachScoreInformation.find_by_matematika5 88.9

    assert_not_nil PmdkEachScoreInformation.find_by_kimia1 98.9
    assert_not_nil PmdkEachScoreInformation.find_by_kimia2 98.3
    assert_not_nil  PmdkEachScoreInformation.find_by_kimia3 88.7
    assert_not_nil  PmdkEachScoreInformation.find_by_kimia4 88.5
    assert_not_nil  PmdkEachScoreInformation.find_by_kimia5 88.1

    assert_not_nil PmdkEachScoreInformation.find_by_inggris1 88.5
    assert_not_nil PmdkEachScoreInformation.find_by_inggris2 56.8
    assert_not_nil  PmdkEachScoreInformation.find_by_inggris3 77.2
    assert_not_nil  PmdkEachScoreInformation.find_by_inggris4 88.1
    assert_not_nil  PmdkEachScoreInformation.find_by_inggris5 99.3
  end
  test 'should create new pmdk each score information but reject non-permited params' do
    get new_pmdk_each_score_information_path
    assert_response :success
    assert_difference 'PmdkEachScoreInformation.count' do
      post pmdk_each_score_informations_path, params: { pmdk_each_score_information: {
        matematika_semester1: 90, matematika_semester2: 80,
        matematika_semester3: 89, matematika_semester4: 90.8,
        matematika5: 88.9, kimia1: 98.9,
        kimia2: 98.3, kimia3: 88.7,
        kimia4: 88.5, kimia5: 88.1,
        fisika1: 34.9, fisika2: 99.9,
        fisika3: 88.9, fisika4: 99.7,
        fisika5: 67.7, inggris1: 88.5,
        inggris2: 56.8, inggris3: 77.2,
        inggris4: 88.1, inggris5: 99.3, user_id: 9_888_090
      } }
    end
    assert_nil PmdkEachScoreInformation.find_by_user_id 9_888_090
  end
  test 'should reject to create new pmdk each score information for invalid data' do
    get new_pmdk_each_score_information_path
    assert_response :success
    assert_no_difference 'PmdkEachScoreInformation.count' do
      post pmdk_each_score_informations_path, params: { pmdk_each_score_information: {
        matematika_semester1: 90.12, matematika_semester2: 0,
        matematika_semester3: 89, matematika_semester4: 90.8,
        matematika5: 88.9, kimia1: 98.9,
        kimia2: 98.3, kimia3: 88.7,
        kimia4: 88.5, kimia5: 88.1,
        fisika1: 34.9, fisika2: 99.9,
        fisika3: 88.9, fisika4: 99.7,
        fisika5: 67.7, inggris1: 88.5,
        inggris2: 56.8, inggris3: 77.2,
        inggris4: 88.1, inggris5: 99.3
      } }
    end
    assert_nil PmdkEachScoreInformation.find_by_matematika_semester1 90.12
  end
  test 'should update each pmdk score information' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
    patch pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one)),
          params: { pmdk_each_score_information: {
            matematika_semester1: 90.12, matematika_semester2: 17.8,
            matematika_semester3: 89, matematika_semester4: 90.8,
            matematika5: 88.9, kimia1: 98.9,
            kimia2: 98.3, kimia3: 88.7,
            kimia4: 88.5, kimia5: 88.1,
            fisika1: 34.9, fisika2: 99.9,
            fisika3: 88.9, fisika4: 99.7,
            fisika5: 67.7, inggris1: 88.5,
            inggris2: 56.8, inggris3: 77.2,
            inggris4: 88.1, inggris5: 99.3
          } }
    pmdk_each_score_informations(:pmdk_each_score_one).reload
    assert_equal 90.12, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester1
    assert_equal 17.8, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester2
    assert_equal 89, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester3
    assert_equal 90.8, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester4
    assert_equal 88.9, pmdk_each_score_informations(:pmdk_each_score_one).matematika5

    assert_equal 99.3, pmdk_each_score_informations(:pmdk_each_score_one).inggris5
    assert_equal 88.1, pmdk_each_score_informations(:pmdk_each_score_one).inggris4
    assert_equal 77.2, pmdk_each_score_informations(:pmdk_each_score_one).inggris3
    assert_equal 56.8, pmdk_each_score_informations(:pmdk_each_score_one).inggris2
    assert_equal 88.5, pmdk_each_score_informations(:pmdk_each_score_one).inggris1
  end
  test 'should reject to update each pmdk score for invalid data' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
    patch pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one)),
          params: { pmdk_each_score_information: {
            matematika_semester1: 90.12, matematika_semester2: 17.8,
            matematika_semester3: 89, matematika_semester4: 90.8,
            matematika5: 88.9, kimia1: 98.9,
            kimia2: 98.3, kimia3: 88.7,
            kimia4: 88.5, kimia5: 88.1,
            fisika1: 34.9, fisika2: 99.9,
            fisika3: 88.9, fisika4: 99.7,
            fisika5: 67.7, inggris1: 88.5,
            inggris2: 56.8, inggris3: 77.2,
            inggris4: 88.1, inggris5: 0
          } }
    pmdk_each_score_informations(:pmdk_each_score_one).reload
    assert_not_equal 0, pmdk_each_score_informations(:pmdk_each_score_one).inggris5
  end
  test 'should reject non-permited params during update each pmdk score' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
    patch pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one)),
          params: { pmdk_each_score_information: {
            matematika_semester1: 90.12, matematika_semester2: 17.8,
            matematika_semester3: 89, matematika_semester4: 90.8,
            matematika5: 88.9, kimia1: 98.9,
            kimia2: 98.3, kimia3: 88.7,
            kimia4: 88.5, kimia5: 88.1,
            fisika1: 34.9, fisika2: 99.9,
            fisika3: 88.9, fisika4: 99.7,
            fisika5: 67.7, inggris1: 88.5,
            inggris2: 56.8, inggris3: 77.2,
            inggris4: 88.1, inggris5: 89, user_id: 888_999_569
          } }
    pmdk_each_score_informations(:pmdk_each_score_one).reload
    assert_not_equal 888_999_569, pmdk_each_score_informations(:pmdk_each_score_one).user_id
  end

  test 'should reject to send new request for pmdk each score' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert logged_in?
    get new_pmdk_each_score_information_path
    assert_response :redirect
  end
  test 'should reject to send post request for exist pmdk each score' do
    get login_path
    post login_path, params: { session: {
      email: users(:archer).email, password: 'password'
    } }
    assert logged_in?
    post pmdk_each_score_informations_path, params: { pmdk_each_score_information: {
      matematika_semester1: 90, matematika_semester2: 80,
      matematika_semester3: 89, matematika_semester4: 90.8,
      matematika5: 88.9, kimia1: 98.9,
      kimia2: 98.3, kimia3: 88.7,
      kimia4: 88.5, kimia5: 88.1,
      fisika1: 34.9, fisika2: 99.9,
      fisika3: 88.9, fisika4: 99.7,
      fisika5: 67.7, inggris1: 88.5,
      inggris2: 56.8, inggris3: 77.2,
      inggris4: 88.1, inggris5: 99.3, user_id: 9_888_090
    } }
    assert_response :redirect
  end
end
