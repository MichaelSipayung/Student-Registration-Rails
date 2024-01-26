require "test_helper"

class AchievementTests < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    @achievement  = achievements(:first_achievement)
    @achievement.save
  end
  test "should create new achievement" do
    get new_achievement_path
    assert_template 'achievements/new'
    assert_difference 'Achievement.count' do
      post achievements_path, params: {achievement: {
        nama_prestasi: 'pencak silat', tahun: '2022-12-14', tingkat: 'nasional', kategori: 'non akademik'
      }}
    end
    assert_not_nil Achievement.find_by_nama_prestasi('pencak silat')
    #insert multiple times
    get new_achievement_path
    assert_template 'achievements/new'
    assert_difference 'Achievement.count' do
      post achievements_path, params: {achievement: {
        nama_prestasi: 'olimpiade sains', tahun: '2022-12-14', tingkat: 'internasional',
        kategori: 'non akademik'
      }}
    end
    assert_not_nil Achievement.find_by_nama_prestasi('olimpiade sains')
  end
  test "should reject to create new achievements" do
    get new_achievement_path
    assert_template 'achievements/new'
    assert_no_difference 'Achievement.count' do
      post achievements_path, params: {achievement: {
        nama_prestasi: 'oli', tahun: '2022-12-14', tingkat: 'internasional',
        kategori: 'non akademik'
      }}
    end
    assert_nil Achievement.find_by_nama_prestasi('oli')
    get new_achievement_path
    assert_template 'achievements/new'
    assert_no_difference 'Achievement.count' do
      post achievements_path, params: {achievement: {
        nama_prestasi: 'olimpiade', tahun: '2022-12-14', tingkat: 'internasional',
        kategori: 'non'
      }}
    end
    assert_nil Achievement.find_by_kategori('non')
  end
  test "should reject unpermited params to create achievement" do
    get new_achievement_path
    assert_template 'achievements/new'
    assert_difference 'Achievement.count' do
      post achievements_path, params: {achievement: {
        nama_prestasi: 'olimpiade', tahun: '2022-12-14', tingkat: 'internasional',
        kategori: 'non akademik', user_id: 13312098
      }}
    end
    assert_nil Achievement.find_by_user_id(13312098)
  end
  test "should update achievement for valid data" do
    get edit_achievement_path(achievements(:first_achievement))
    assert_template 'achievements/edit'
    patch achievement_path(achievements(:first_achievement)), params: {achievement: {
      nama_prestasi: 'lompat jauh', tahun: '2021-10-12',
      kategori: 'non akademik', tingkat: 'provinsi'
    }}
    assert_equal 'lompat jauh', achievements(:first_achievement).reload.nama_prestasi
    assert_equal 'non akademik', achievements(:first_achievement).reload.kategori
    assert_equal 'provinsi', achievements(:first_achievement).reload.tingkat
    assert_not_equal achievements(:first_achievement).reload.nama_prestasi,
                     achievements(:second_achievement).reload.nama_prestasi
    #update multiple times
    get edit_achievement_path(achievements(:second_achievement))
    assert_template 'achievements/edit'
    patch achievement_path(achievements(:second_achievement)), params: {achievement: {
      nama_prestasi: 'tenis meja', tahun: '2020-10-12',
      kategori: 'akademik', tingkat: 'internasional'
    }}
    assert_equal 'tenis meja', achievements(:second_achievement).reload.nama_prestasi
    assert_equal 'akademik', achievements(:second_achievement).reload.kategori
    assert_equal 'internasional', achievements(:second_achievement).reload.tingkat
  end
  test "should reject to update data for invalid information" do
    get edit_achievement_path(achievements(:first_achievement))
    assert_template 'achievements/edit'
    patch achievement_path(achievements(:first_achievement)), params: {achievement: {
      nama_prestasi: 'lompat jauh', tahun: '2021-10-12',
      kategori: 'non', tingkat: 'pro'
    }}
    assert_nil Achievement.find_by_nama_prestasi('lompat jauh')
    get edit_achievement_path(achievements(:second_achievement))
    assert_template 'achievements/edit'
    patch achievement_path(achievements(:second_achievement)), params: {achievement: {
      nama_prestasi: 'lom', tahun: '2021-10-12',
      kategori: 'akademik', tingkat: 'profesional'
    }}
    assert_not_equal 'lom', achievements(:second_achievement).reload.nama_prestasi
  end
  test "should not update for non permitted parameter" do
    get edit_achievement_path(achievements(:first_achievement))
    assert_template 'achievements/edit'
    patch achievement_path(achievements(:first_achievement)), params: {achievement: {
      nama_prestasi: 'lompat jauh', tahun: '2021-10-12',
      kategori: 'akademik', tingkat: 'profesional', user_id: 9087898
    }}
    assert_not_equal 9087898, achievements(:first_achievement).reload.user_id
  end
end
