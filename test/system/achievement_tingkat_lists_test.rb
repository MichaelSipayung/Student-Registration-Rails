# frozen_string_literal: true

require 'application_system_test_case'

class AchievementTingkatListsTest < ApplicationSystemTestCase
  setup do
    @achievement_tingkat_list = achievement_tingkat_lists(:one)
  end

  test 'visiting the index' do
    visit achievement_tingkat_lists_url
    assert_selector 'h1', text: 'Achievement tingkat lists'
  end

  test 'should create achievement tingkat list' do
    visit achievement_tingkat_lists_url
    click_on 'New achievement tingkat list'

    fill_in 'Tingkat', with: @achievement_tingkat_list.tingkat
    click_on 'Create Achievement tingkat list'

    assert_text 'Achievement tingkat list was successfully created'
    click_on 'Back'
  end

  test 'should update Achievement tingkat list' do
    visit achievement_tingkat_list_url(@achievement_tingkat_list)
    click_on 'Edit this achievement tingkat list', match: :first

    fill_in 'Tingkat', with: @achievement_tingkat_list.tingkat
    click_on 'Update Achievement tingkat list'

    assert_text 'Achievement tingkat list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Achievement tingkat list' do
    visit achievement_tingkat_list_url(@achievement_tingkat_list)
    click_on 'Destroy this achievement tingkat list', match: :first

    assert_text 'Achievement tingkat list was successfully destroyed'
  end
end
