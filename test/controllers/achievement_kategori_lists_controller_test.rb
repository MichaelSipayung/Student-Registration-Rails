# frozen_string_literal: true

require 'test_helper'

class AchievementKategoriListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path
    post login_path, params: { session: {
      email: users(:michael).email, password: 'password'
    } }
    @achievement_kategori_list = achievement_kategori_lists(:one)
  end

  test 'should get index' do
    get achievement_kategori_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_achievement_kategori_list_url
    assert_response :success
  end

  test 'should create achievement_kategori_list' do
    assert_difference('AchievementKategoriList.count') do
      post achievement_kategori_lists_url,
           params: { achievement_kategori_list: { kategori: 'non akademik' } }
    end

    assert_redirected_to achievement_kategori_list_url(AchievementKategoriList.last)
  end

  test 'should show achievement_kategori_list' do
    get achievement_kategori_list_url(@achievement_kategori_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_achievement_kategori_list_url(@achievement_kategori_list)
    assert_response :success
  end

  test 'should update achievement_kategori_list' do
    patch achievement_kategori_list_url(@achievement_kategori_list),
          params: { achievement_kategori_list: { kategori: 'non akademik 2' } }
    assert_redirected_to achievement_kategori_list_url(@achievement_kategori_list)
  end

  test 'should destroy achievement_kategori_list' do
    assert_difference('AchievementKategoriList.count', -1) do
      delete achievement_kategori_list_url(@achievement_kategori_list)
    end

    assert_redirected_to achievement_kategori_lists_url
  end
end
