# frozen_string_literal: true

require 'application_system_test_case'

class LanguageNameListsTest < ApplicationSystemTestCase
  setup do
    @language_name_list = language_name_lists(:one)
  end

  test 'visiting the index' do
    visit language_name_lists_url
    assert_selector 'h1', text: 'Language name lists'
  end

  test 'should create language name list' do
    visit language_name_lists_url
    click_on 'New language name list'

    fill_in 'Bahasa', with: @language_name_list.bahasa
    click_on 'Create Language name list'

    assert_text 'Language name list was successfully created'
    click_on 'Back'
  end

  test 'should update Language name list' do
    visit language_name_list_url(@language_name_list)
    click_on 'Edit this language name list', match: :first

    fill_in 'Bahasa', with: @language_name_list.bahasa
    click_on 'Update Language name list'

    assert_text 'Language name list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Language name list' do
    visit language_name_list_url(@language_name_list)
    click_on 'Destroy this language name list', match: :first

    assert_text 'Language name list was successfully destroyed'
  end
end
