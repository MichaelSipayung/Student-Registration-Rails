require "test_helper"

class PmdkEachScoreInformationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
  end
  test 'should get new pmdk each score information' do
    get new_pmdk_each_score_information_path
    assert_response :success
  end
  test 'should get edit pmdk each score information' do
    assert is_logged_in?
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
  end
  test 'should create new pmdk each score information' do
    get new_pmdk_each_score_information_path
    assert_response :success
    assert_difference 'PmdkEachScoreInformation.count' do
      post pmdk_each_score_informations_path, params: {pmdk_each_score_information: {
        matematika_semester_1: 90, matematika_semester_2: 80,
        matematika_semester_3: 89, matematika_semester_4: 90.8,
        matematika_semester_5: 88.9, kimia_semester_1: 98.9,
        kimia_semester_2: 98.3, kimia_semester_3: 88.7,
        kimia_semester_4: 88.5,kimia_semester_5: 88.1,
        fisika_semester_1: 34.9, fisika_semester_2: 99.9,
        fisika_semester_3: 88.9, fisika_semester_4: 99.7,
        fisika_semester_5: 67.7, bahasa_inggris_semester_1: 88.5,
        bahasa_inggris_semester_2: 56.8, bahasa_inggris_semester_3: 77.2,
        bahasa_inggris_semester_4: 88.1,bahasa_inggris_semester_5: 99.3
      }}
    end
    assert_not_nil PmdkEachScoreInformation.find_by_user_id users(:michael).id
    assert_not_nil PmdkEachScoreInformation.find_by_fisika_semester_1 34.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika_semester_2 99.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika_semester_3 88.9
    assert_not_nil PmdkEachScoreInformation.find_by_fisika_semester_4 99.7
    assert_not_nil PmdkEachScoreInformation.find_by_fisika_semester_5 67.7

    assert_not_nil PmdkEachScoreInformation.find_by_matematika_semester_1 90
    assert_not_nil PmdkEachScoreInformation.find_by_matematika_semester_2 80
    assert_not_nil  PmdkEachScoreInformation.find_by_matematika_semester_3 89
    assert_not_nil  PmdkEachScoreInformation.find_by_matematika_semester_4 90.8
    assert_not_nil  PmdkEachScoreInformation.find_by_matematika_semester_5 88.9

    assert_not_nil PmdkEachScoreInformation.find_by_kimia_semester_1 98.9
    assert_not_nil PmdkEachScoreInformation.find_by_kimia_semester_2 98.3
    assert_not_nil  PmdkEachScoreInformation.find_by_kimia_semester_3 88.7
    assert_not_nil  PmdkEachScoreInformation.find_by_kimia_semester_4 88.5
    assert_not_nil  PmdkEachScoreInformation.find_by_kimia_semester_5 88.1

    assert_not_nil PmdkEachScoreInformation.find_by_bahasa_inggris_semester_1 88.5
    assert_not_nil PmdkEachScoreInformation.find_by_bahasa_inggris_semester_2 56.8
    assert_not_nil  PmdkEachScoreInformation.find_by_bahasa_inggris_semester_3 77.2
    assert_not_nil  PmdkEachScoreInformation.find_by_bahasa_inggris_semester_4 88.1
    assert_not_nil  PmdkEachScoreInformation.find_by_bahasa_inggris_semester_5 99.3
  end
  test 'should create new pmdk each score information but reject non-permited params' do
    get new_pmdk_each_score_information_path
    assert_response :success
    assert_difference 'PmdkEachScoreInformation.count' do
      post pmdk_each_score_informations_path, params: {pmdk_each_score_information: {
        matematika_semester_1: 90, matematika_semester_2: 80,
        matematika_semester_3: 89, matematika_semester_4: 90.8,
        matematika_semester_5: 88.9, kimia_semester_1: 98.9,
        kimia_semester_2: 98.3, kimia_semester_3: 88.7,
        kimia_semester_4: 88.5,kimia_semester_5: 88.1,
        fisika_semester_1: 34.9, fisika_semester_2: 99.9,
        fisika_semester_3: 88.9, fisika_semester_4: 99.7,
        fisika_semester_5: 67.7, bahasa_inggris_semester_1: 88.5,
        bahasa_inggris_semester_2: 56.8, bahasa_inggris_semester_3: 77.2,
        bahasa_inggris_semester_4: 88.1,bahasa_inggris_semester_5: 99.3, user_id: 9888090
      }}
    end
    assert_nil PmdkEachScoreInformation.find_by_user_id 9888090
  end
  test 'should reject to create new pmdk each score information for invalid data' do
    get new_pmdk_each_score_information_path
    assert_response :success
    assert_no_difference 'PmdkEachScoreInformation.count' do
      post pmdk_each_score_informations_path, params: {pmdk_each_score_information: {
        matematika_semester_1: 90.12, matematika_semester_2: 0,
        matematika_semester_3: 89, matematika_semester_4: 90.8,
        matematika_semester_5: 88.9, kimia_semester_1: 98.9,
        kimia_semester_2: 98.3, kimia_semester_3: 88.7,
        kimia_semester_4: 88.5,kimia_semester_5: 88.1,
        fisika_semester_1: 34.9, fisika_semester_2: 99.9,
        fisika_semester_3: 88.9, fisika_semester_4: 99.7,
        fisika_semester_5: 67.7, bahasa_inggris_semester_1: 88.5,
        bahasa_inggris_semester_2: 56.8, bahasa_inggris_semester_3: 77.2,
        bahasa_inggris_semester_4: 88.1,bahasa_inggris_semester_5: 99.3
      }}
    end
    assert_nil PmdkEachScoreInformation.find_by_matematika_semester_1 90.12
  end
  test 'should update each pmdk score information' do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
    patch pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one)),
          params: {pmdk_each_score_information: {
            matematika_semester_1: 90.12, matematika_semester_2: 17.8,
            matematika_semester_3: 89, matematika_semester_4: 90.8,
            matematika_semester_5: 88.9, kimia_semester_1: 98.9,
            kimia_semester_2: 98.3, kimia_semester_3: 88.7,
            kimia_semester_4: 88.5,kimia_semester_5: 88.1,
            fisika_semester_1: 34.9, fisika_semester_2: 99.9,
            fisika_semester_3: 88.9, fisika_semester_4: 99.7,
            fisika_semester_5: 67.7, bahasa_inggris_semester_1: 88.5,
            bahasa_inggris_semester_2: 56.8, bahasa_inggris_semester_3: 77.2,
            bahasa_inggris_semester_4: 88.1,bahasa_inggris_semester_5: 99.3
          }}
    pmdk_each_score_informations(:pmdk_each_score_one).reload
    assert_equal 90.12, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester_1
    assert_equal 17.8, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester_2
    assert_equal 89, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester_3
    assert_equal 90.8, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester_4
    assert_equal 88.9, pmdk_each_score_informations(:pmdk_each_score_one).matematika_semester_5

    assert_equal 99.3, pmdk_each_score_informations(:pmdk_each_score_one).bahasa_inggris_semester_5
    assert_equal 88.1, pmdk_each_score_informations(:pmdk_each_score_one).bahasa_inggris_semester_4
    assert_equal 77.2, pmdk_each_score_informations(:pmdk_each_score_one).bahasa_inggris_semester_3
    assert_equal 56.8, pmdk_each_score_informations(:pmdk_each_score_one).bahasa_inggris_semester_2
    assert_equal 88.5, pmdk_each_score_informations(:pmdk_each_score_one).bahasa_inggris_semester_1
  end
  test 'should reject to update each pmdk score for invalid data' do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
    patch pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one)),
          params: {pmdk_each_score_information: {
            matematika_semester_1: 90.12, matematika_semester_2: 17.8,
            matematika_semester_3: 89, matematika_semester_4: 90.8,
            matematika_semester_5: 88.9, kimia_semester_1: 98.9,
            kimia_semester_2: 98.3, kimia_semester_3: 88.7,
            kimia_semester_4: 88.5,kimia_semester_5: 88.1,
            fisika_semester_1: 34.9, fisika_semester_2: 99.9,
            fisika_semester_3: 88.9, fisika_semester_4: 99.7,
            fisika_semester_5: 67.7, bahasa_inggris_semester_1: 88.5,
            bahasa_inggris_semester_2: 56.8, bahasa_inggris_semester_3: 77.2,
            bahasa_inggris_semester_4: 88.1,bahasa_inggris_semester_5: 0
          }}
    pmdk_each_score_informations(:pmdk_each_score_one).reload
    assert_not_equal 0, pmdk_each_score_informations(:pmdk_each_score_one).bahasa_inggris_semester_5
  end
  test 'should reject non-permited params during update each pmdk score' do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    get edit_pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one))
    assert_response :success
    patch pmdk_each_score_information_path(pmdk_each_score_informations(:pmdk_each_score_one)),
          params: {pmdk_each_score_information: {
            matematika_semester_1: 90.12, matematika_semester_2: 17.8,
            matematika_semester_3: 89, matematika_semester_4: 90.8,
            matematika_semester_5: 88.9, kimia_semester_1: 98.9,
            kimia_semester_2: 98.3, kimia_semester_3: 88.7,
            kimia_semester_4: 88.5,kimia_semester_5: 88.1,
            fisika_semester_1: 34.9, fisika_semester_2: 99.9,
            fisika_semester_3: 88.9, fisika_semester_4: 99.7,
            fisika_semester_5: 67.7, bahasa_inggris_semester_1: 88.5,
            bahasa_inggris_semester_2: 56.8, bahasa_inggris_semester_3: 77.2,
            bahasa_inggris_semester_4: 88.1,bahasa_inggris_semester_5: 89, user_id: 888999569
          }}
    pmdk_each_score_informations(:pmdk_each_score_one).reload
    assert_not_equal 888999569, pmdk_each_score_informations(:pmdk_each_score_one).user_id
  end
end
