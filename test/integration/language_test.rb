require "test_helper"

class LanguageTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    post login_path, params: {session: {email: users(:archer).email, password: 'password'}}
  end
  test "should create new language" do
    get new_languages_path
    assert_difference 'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'indonesia', tingkat: 'mahir'
      }}
    end
    #insert multiple language
    get new_languages_path
    assert_difference 'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'mandarin', tingkat: 'pemula'
      }}
    end
  end
  test "should reject to create language" do
    get new_languages_path
    assert_no_difference 'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'ind', tingkat: 'pem'
      }}
    end
  end
  test "should not create language based on unpermited params" do
    get new_languages_path
    assert_difference  'Language.count' do
      post languages_path, params: {language: {
        nama_bahasa: 'chinese', tingkat: 'profesional', user_id: 138974
      }}
    end
    unpermited_id = Language.find_by_user_id(138974)
    assert_nil unpermited_id
  end
end
