require "test_helper"

class LanguageNameListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email,
      password: 'password'
    }}
    @language_name_list = language_name_lists(:one)
  end

  test 'should get index' do
    get language_name_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_language_name_list_url
    assert_response :success
  end

  test 'should create language_name_list' do
    assert_difference("LanguageNameList.count") do
      post language_name_lists_url, params: { language_name_list: { bahasa: 'inggris' } }
    end

    assert_redirected_to language_name_list_url(LanguageNameList.last)
  end

  test 'should show language_name_list' do
    get language_name_list_url(@language_name_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_language_name_list_url(@language_name_list)
    assert_response :success
  end

  test 'should update language_name_list' do
    patch language_name_list_url(@language_name_list), params:
      { language_name_list: { bahasa: 'chinese' } }
    assert_redirected_to language_name_list_url(@language_name_list)
  end

  test 'should destroy language_name_list' do
    assert_difference("LanguageNameList.count", -1) do
      delete language_name_list_url(@language_name_list)
    end

    assert_redirected_to language_name_lists_url
  end
end
