require "test_helper"

class RequireAdminTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    get login_path
    post login_path, params: {session: {
      email: @user.email, password: 'password'
    }}
  end
  test 'province address list send get request' do
    get new_address_province_list_url
    assert_response :redirect
  end
  test 'kabupaten address list send get request' do
    get new_address_kabupaten_list_url
    assert_response :redirect
  end
  test 'kecamatan address list send get request' do
    get new_address_kecamatan_list_url
    assert_response :redirect
  end
  test 'personal religion list send get' do
    get new_personal_religion_list_url
    assert_response :redirect
  end
  test 'personal gender list send get' do
    get new_personal_gender_list_url
    assert_response :redirect
  end
  test 'parent job list send get' do
    get new_parent_job_list_url
    assert_response :redirect
  end
  test 'parent education list send get' do
    get new_parent_education_list_url
    assert_response :redirect
  end
  test 'source motivation list send get' do
    get new_source_motivation_list_url
    assert_response :redirect
  end
  test 'source information list send get' do
    get new_source_information_list_url
    assert_response :redirect
  end
  test 'pmdk school information list send get' do
    get new_pmdk_school_list_url
    assert_response :redirect
  end
  test 'organization degree list send get' do
    get new_organization_degree_list_url
    assert_response :redirect
  end
  test 'major list send get' do
    get new_major_list_url
    assert_response :redirect
  end
  test 'language name list send get' do
    get new_language_name_list_url
    assert_response :redirect
  end
  test 'language degree list send get' do
    get new_language_degree_list_url
    assert_response :redirect
  end
  test 'high school major send get' do
    get new_high_school_major_url
    assert_response :redirect
  end
  test 'extra list send get' do
    get new_extra_list_url
    assert_response :redirect
  end
  test 'batch list send get' do
    get new_batch_list_url
    assert_response :redirect
  end
  test 'all school list send get' do
    get new_all_school_list_url
    assert_response :redirect
  end
  test 'achievement tingkat list send get' do
    get new_achievement_tingkat_list_url
    assert_response :redirect
  end
  test 'achievement kategori list send get' do
    get new_achievement_kategori_list_url
    assert_response :redirect
  end
  test 'accreditation school list send get' do
    get new_accreditation_school_list_url
    assert_response :redirect
  end

end
