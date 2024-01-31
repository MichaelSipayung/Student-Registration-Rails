# frozen_string_literal: true

require 'application_system_test_case'

class SourceMotivationListsTest < ApplicationSystemTestCase
  setup do
    @source_motivation_list = source_motivation_lists(:one)
  end

  test 'visiting the index' do
    visit source_motivation_lists_url
    assert_selector 'h1', text: 'Source motivation lists'
  end

  test 'should create source motivation list' do
    visit source_motivation_lists_url
    click_on 'New source motivation list'

    fill_in 'Motivasi', with: @source_motivation_list.motivasi
    click_on 'Create Source motivation list'

    assert_text 'Source motivation list was successfully created'
    click_on 'Back'
  end

  test 'should update Source motivation list' do
    visit source_motivation_list_url(@source_motivation_list)
    click_on 'Edit this source motivation list', match: :first

    fill_in 'Motivasi', with: @source_motivation_list.motivasi
    click_on 'Update Source motivation list'

    assert_text 'Source motivation list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Source motivation list' do
    visit source_motivation_list_url(@source_motivation_list)
    click_on 'Destroy this source motivation list', match: :first

    assert_text 'Source motivation list was successfully destroyed'
  end
end
