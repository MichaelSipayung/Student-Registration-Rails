# frozen_string_literal: true

require 'application_system_test_case'

class MajorListsTest < ApplicationSystemTestCase
  setup do
    @major_list = major_lists(:one)
  end

  test 'visiting the index' do
    visit major_lists_url
    assert_selector 'h1', text: 'Major lists'
  end

  test 'should create major list' do
    visit major_lists_url
    click_on 'New major list'

    fill_in 'Jurusan', with: @major_list.jurusan
    click_on 'Create Major list'

    assert_text 'Major list was successfully created'
    click_on 'Back'
  end

  test 'should update Major list' do
    visit major_list_url(@major_list)
    click_on 'Edit this major list', match: :first

    fill_in 'Jurusan', with: @major_list.jurusan
    click_on 'Update Major list'

    assert_text 'Major list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Major list' do
    visit major_list_url(@major_list)
    click_on 'Destroy this major list', match: :first

    assert_text 'Major list was successfully destroyed'
  end
end
