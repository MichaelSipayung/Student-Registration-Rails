require "test_helper"

class LanguageTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:archer).email, password: 'password'}}
  end
  test "should create new language" do
    get new_language_path
    assert_difference 'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'indonesia', tingkat: 'mahir'
      }}
    end
    #insert multiple language
    get new_language_path
    assert_difference 'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'mandarin', tingkat: 'pemula'
      }}
    end
  end
  test "should reject to create language" do
    get new_language_path
    assert_no_difference 'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'ind', tingkat: 'pem'
      }}
    end
  end
  test "should not create language based on unpermited params" do
    get new_language_path
    assert_difference  'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'chinese', tingkat: 'profesional', user_id: 138974
      }}
    end
    unpermited_id = Language.find_by_user_id(138974)
    assert_nil unpermited_id
  end
  test "should update language" do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_language_path languages(:bahasa)
    assert_template 'languages/edit'
    patch language_path(languages(:bahasa)), params: {language: {
      nama_bahasa: 'spanyol', tingkat: 'advanced'
    }}
    assert_equal 'spanyol', languages(:bahasa).reload.nama_bahasa
    assert_equal 'advanced', languages(:bahasa).reload.tingkat
    #update multiple times
    get edit_language_path languages(:batak)
    assert_template 'languages/edit'
    patch language_path(languages(:batak)), params: {language: {
      nama_bahasa: 'batak mandailing', tingkat: 'mahir'
    }}
    assert_equal 'batak mandailing', languages(:batak).reload.nama_bahasa
    assert_equal 'mahir', languages(:batak).reload.tingkat
  end
  test "should reject to update language" do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_language_path languages(:bahasa)
    assert_template 'languages/edit'
    patch language_path(languages(:bahasa)), params: {language: {
      nama_bahasa: 'spa', tingkat: 'adv'
    }}
    assert_not_equal 'spa', languages(:bahasa).reload.nama_bahasa
    assert_not_equal 'adv', languages(:bahasa).reload.tingkat
  end
  test "should not allow unpermited attribute to update" do
    get login_path
    post login_path, params: {session: {email: users(:michael).email, password: 'password'}}
    get edit_language_path languages(:bahasa)
    assert_template 'languages/edit'
    patch language_path(languages(:bahasa)), params: {language: {
      nama_bahasa: 'spanyol', tingkat: 'advanced', user_id: 139685142
    }}
    assert_not_equal 139685142, languages(:bahasa).reload.user_id
  end
end
