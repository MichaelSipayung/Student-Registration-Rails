require "test_helper"

class UtbkScoresControllerTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
  end
  test "should get new score" do
    assert is_logged_in?
    get new_utbk_score_url
    assert_response :success
  end

  test "should update the current logged in user score utbk" do
    get login_path
    post login_path, params: {session: {
      email: users(:archer).email, password: 'password'
    }}
    get edit_utbk_score_url utbk_scores(:utbk_score_one)
    assert_response :success
    patch utbk_score_path, params: {
      utbk_score: {no_peserta: '200-1bx-2', tanggal_ujian: '2021-12-11',
                   jumlah_nilai_semester_6: 1000.5, jumlah_pelajaran_semester_6: 15,
                   nilai_penalaran_umum: 190.5,
                   nilai_pengetahuan_kuantitatif: 110.5,
                   nilai_kemampuan_memahami_bacaan_dan_menulis: 100.5,
                   nilai_pengetahuan_dan_pemahaman_umum: 150.5
    }}
    assert_equal '200-1bx-2', utbk_scores(:utbk_score_one).reload.no_peserta
    assert_equal 1000.5, utbk_scores(:utbk_score_one).jumlah_nilai_semester_6
    assert_equal 15, utbk_scores(:utbk_score_one).jumlah_pelajaran_semester_6

    assert_equal 190.5, utbk_scores(:utbk_score_one).reload.nilai_penalaran_umum
    assert_equal 110.5, utbk_scores(:utbk_score_one).reload.nilai_pengetahuan_kuantitatif
    assert_equal 100.5, utbk_scores(:utbk_score_one).reload.nilai_kemampuan_memahami_bacaan_dan_menulis
    assert_equal 150.5, utbk_scores(:utbk_score_one).reload.nilai_pengetahuan_dan_pemahaman_umum
  end
  test "should create new score for current login user" do
    get new_utbk_score_path
    assert_response :success
    assert_difference 'UtbkScore.count' do
      post utbk_scores_path, params: {
        utbk_score: {no_peserta: '200-1bx-2', tanggal_ujian: '2020-12-11',
          jumlah_nilai_semester_6: 1000.5, jumlah_pelajaran_semester_6: 15,
          nilai_penalaran_umum: 190.5,
          nilai_pengetahuan_kuantitatif: 110.5,
          nilai_kemampuan_memahami_bacaan_dan_menulis: 100.5,
          nilai_pengetahuan_dan_pemahaman_umum: 150.5
        }
      }
    end
    assert_not_nil  UtbkScore.find_by_no_peserta '200-1bx-2'
    assert_not_nil UtbkScore.find_by_jumlah_pelajaran_semester_6 15
    assert_not_nil UtbkScore.find_by_jumlah_nilai_semester_6 1000.5
    assert_not_nil UtbkScore.find_by_nilai_penalaran_umum 190.5
    assert_not_nil UtbkScore.find_by_nilai_pengetahuan_kuantitatif 110.5
    assert_not_nil UtbkScore.find_by_nilai_kemampuan_memahami_bacaan_dan_menulis 100.5
    assert_not_nil UtbkScore.find_by_nilai_pengetahuan_dan_pemahaman_umum 150.5
  end
  #
  test "should get edit" do
    assert is_logged_in?
    get edit_utbk_score_url(utbk_scores(:utbk_score_two))
    assert_response :success
  end
  test "should reject non permited params while created utbk score" do
    get new_utbk_score_path
    assert_response :success
    assert_difference 'UtbkScore.count' do
      post utbk_scores_path, params: {
        utbk_score: {no_peserta: '200-1bx-2', tanggal_ujian: '2020-12-11',
                     jumlah_nilai_semester_6: 1000.5, jumlah_pelajaran_semester_6: 15,
                     nilai_penalaran_umum: 190.5,
                     nilai_pengetahuan_kuantitatif: 110.5,
                     nilai_kemampuan_memahami_bacaan_dan_menulis: 100.5,
                     nilai_pengetahuan_dan_pemahaman_umum: 150.5, user_id: 9000098
        }
      }
    end
    assert_nil UtbkScore.find_by_user_id 9000098
  end
  test "should reject non permited params while update the utbk score" do
    get new_utbk_score_path
    assert_response :success
    assert_difference 'UtbkScore.count' do
      post utbk_scores_path, params: {
        utbk_score: {no_peserta: '200-1bx-2', tanggal_ujian: '2020-12-11',
                     jumlah_nilai_semester_6: 1000.5, jumlah_pelajaran_semester_6: 15,
                     nilai_penalaran_umum: 190.5,
                     nilai_pengetahuan_kuantitatif: 110.5,
                     nilai_kemampuan_memahami_bacaan_dan_menulis: 100.5,
                     nilai_pengetahuan_dan_pemahaman_umum: 150.5, user_id: 90898008
        }
      }
    end
    assert_nil UtbkScore.find_by_user_id 90898008
  end
  #
  # test "should get show" do
  #   get utbk_scores_show_url
  #   assert_response :success
  # end
end
