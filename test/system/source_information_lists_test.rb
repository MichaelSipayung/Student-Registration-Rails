require "application_system_test_case"

class SourceInformationListsTest < ApplicationSystemTestCase
  setup do
    @source_information_list = source_information_lists(:one)
  end

  test "visiting the index" do
    visit source_information_lists_url
    assert_selector "h1", text: "Source information lists"
  end

  test "should create source information list" do
    visit source_information_lists_url
    click_on "New source information list"

    fill_in "Informasi", with: @source_information_list.informasi
    click_on "Create Source information list"

    assert_text "Source information list was successfully created"
    click_on "Back"
  end

  test "should update Source information list" do
    visit source_information_list_url(@source_information_list)
    click_on "Edit this source information list", match: :first

    fill_in "Informasi", with: @source_information_list.informasi
    click_on "Update Source information list"

    assert_text "Source information list was successfully updated"
    click_on "Back"
  end

  test "should destroy Source information list" do
    visit source_information_list_url(@source_information_list)
    click_on "Destroy this source information list", match: :first

    assert_text "Source information list was successfully destroyed"
  end
end
