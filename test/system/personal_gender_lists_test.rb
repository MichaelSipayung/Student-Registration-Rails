# frozen_string_literal: true

require 'application_system_test_case'

class PersonalGenderListsTest < ApplicationSystemTestCase
  setup do
    @personal_gender_list = personal_gender_lists(:one)
  end

  test 'visiting the index' do
    visit personal_gender_lists_url
    assert_selector 'h1', text: 'Personal gender lists'
  end

  test 'should create personal gender list' do
    visit personal_gender_lists_url
    click_on 'New personal gender list'

    fill_in 'Jenis kelamin', with: @personal_gender_list.jenis_kelamin
    click_on 'Create Personal gender list'

    assert_text 'Personal gender list was successfully created'
    click_on 'Back'
  end

  test 'should update Personal gender list' do
    visit personal_gender_list_url(@personal_gender_list)
    click_on 'Edit this personal gender list', match: :first

    fill_in 'Jenis kelamin', with: @personal_gender_list.jenis_kelamin
    click_on 'Update Personal gender list'

    assert_text 'Personal gender list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Personal gender list' do
    visit personal_gender_list_url(@personal_gender_list)
    click_on 'Destroy this personal gender list', match: :first

    assert_text 'Personal gender list was successfully destroyed'
  end
end
