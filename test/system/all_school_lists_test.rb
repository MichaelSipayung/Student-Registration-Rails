# frozen_string_literal: true

require 'application_system_test_case'

class AllSchoolListsTest < ApplicationSystemTestCase
  setup do
    @all_school_list = all_school_lists(:one)
  end

  test 'visiting the index' do
    visit all_school_lists_url
    assert_selector 'h1', text: 'All school lists'
  end

  test 'should create all school list' do
    visit all_school_lists_url
    click_on 'New all school list'

    fill_in 'Sekolah', with: @all_school_list.sekolah
    click_on 'Create All school list'

    assert_text 'All school list was successfully created'
    click_on 'Back'
  end

  test 'should update All school list' do
    visit all_school_list_url(@all_school_list)
    click_on 'Edit this all school list', match: :first

    fill_in 'Sekolah', with: @all_school_list.sekolah
    click_on 'Update All school list'

    assert_text 'All school list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy All school list' do
    visit all_school_list_url(@all_school_list)
    click_on 'Destroy this all school list', match: :first

    assert_text 'All school list was successfully destroyed'
  end
end
