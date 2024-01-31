# frozen_string_literal: true

require 'application_system_test_case'

class AchievementKategoriListsTest < ApplicationSystemTestCase
  setup do
    @achievement_kategori_list = achievement_kategori_lists(:one)
  end

  test 'visiting the index' do
    visit achievement_kategori_lists_url
    assert_selector 'h1', text: 'Achievement kategori lists'
  end

  test 'should create achievement kategori list' do
    visit achievement_kategori_lists_url
    click_on 'New achievement kategori list'

    fill_in 'Kategori', with: @achievement_kategori_list.kategori
    click_on 'Create Achievement kategori list'

    assert_text 'Achievement kategori list was successfully created'
    click_on 'Back'
  end

  test 'should update Achievement kategori list' do
    visit achievement_kategori_list_url(@achievement_kategori_list)
    click_on 'Edit this achievement kategori list', match: :first

    fill_in 'Kategori', with: @achievement_kategori_list.kategori
    click_on 'Update Achievement kategori list'

    assert_text 'Achievement kategori list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Achievement kategori list' do
    visit achievement_kategori_list_url(@achievement_kategori_list)
    click_on 'Destroy this achievement kategori list', match: :first

    assert_text 'Achievement kategori list was successfully destroyed'
  end
end
