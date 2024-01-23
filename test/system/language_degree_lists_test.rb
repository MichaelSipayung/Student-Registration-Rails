require "application_system_test_case"

class LanguageDegreeListsTest < ApplicationSystemTestCase
  setup do
    @language_degree_list = language_degree_lists(:one)
  end

  test "visiting the index" do
    visit language_degree_lists_url
    assert_selector "h1", text: "Language degree lists"
  end

  test "should create language degree list" do
    visit language_degree_lists_url
    click_on "New language degree list"

    fill_in "Tingkat", with: @language_degree_list.tingkat
    click_on "Create Language degree list"

    assert_text "Language degree list was successfully created"
    click_on "Back"
  end

  test "should update Language degree list" do
    visit language_degree_list_url(@language_degree_list)
    click_on "Edit this language degree list", match: :first

    fill_in "Tingkat", with: @language_degree_list.tingkat
    click_on "Update Language degree list"

    assert_text "Language degree list was successfully updated"
    click_on "Back"
  end

  test "should destroy Language degree list" do
    visit language_degree_list_url(@language_degree_list)
    click_on "Destroy this language degree list", match: :first

    assert_text "Language degree list was successfully destroyed"
  end
end
