require "test_helper"

class OrganizationDegreeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: {session: {
      email: users(:michael).email,
      password: 'password'
    }}
    @organization_degree_list = organization_degree_lists(:one)
  end

  test 'should get index' do
    get organization_degree_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_organization_degree_list_url
    assert_response :success
  end

  test 'should create organization_degree_list' do
    assert_difference("OrganizationDegreeList.count") do
      post organization_degree_lists_url, params:
        { organization_degree_list: { jabatan: 'sekretaris' } }
    end

    assert_redirected_to organization_degree_list_url(OrganizationDegreeList.last)
  end

  test 'should show organization_degree_list' do
    get organization_degree_list_url(@organization_degree_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_organization_degree_list_url(@organization_degree_list)
    assert_response :success
  end

  test 'should update organization_degree_list' do
    patch organization_degree_list_url(@organization_degree_list),
          params: { organization_degree_list: { jabatan: 'wakil ketua' } }
    assert_redirected_to organization_degree_list_url(@organization_degree_list)
  end

  test 'should destroy organization_degree_list' do
    assert_difference("OrganizationDegreeList.count", -1) do
      delete organization_degree_list_url(@organization_degree_list)
    end

    assert_redirected_to organization_degree_lists_url
  end
end
