require "test_helper"

class SourceMotivationListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email, password: 'password'
    }}
    @source_motivation_list = source_motivation_lists(:one)
  end

  test 'should get index' do
    get source_motivation_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_source_motivation_list_url
    assert_response :success
  end

  test 'should create source_motivation_list' do
    assert_difference("SourceMotivationList.count") do
      post source_motivation_lists_url,
           params: { source_motivation_list: { motivasi: 'pendidikan' } }
    end

    assert_redirected_to source_motivation_list_url(SourceMotivationList.last)
  end

  test 'should show source_motivation_list' do
    get source_motivation_list_url(@source_motivation_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_source_motivation_list_url(@source_motivation_list)
    assert_response :success
  end

  test 'should update source_motivation_list' do
    patch source_motivation_list_url(@source_motivation_list),
          params: { source_motivation_list: { motivasi: 'pekerjaan' } }
    assert_redirected_to source_motivation_list_url(@source_motivation_list)
  end

  test 'should destroy source_motivation_list' do
    assert_difference("SourceMotivationList.count", -1) do
      delete source_motivation_list_url(@source_motivation_list)
    end

    assert_redirected_to source_motivation_lists_url
  end
end
