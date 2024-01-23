require "application_system_test_case"

class ExtraListsTest < ApplicationSystemTestCase
  setup do
    @extra_list = extra_lists(:one)
  end

  test "visiting the index" do
    visit extra_lists_url
    assert_selector "h1", text: "Extra lists"
  end

  test "should create extra list" do
    visit extra_lists_url
    click_on "New extra list"

    fill_in "Predikat", with: @extra_list.predikat
    click_on "Create Extra list"

    assert_text "Extra list was successfully created"
    click_on "Back"
  end

  test "should update Extra list" do
    visit extra_list_url(@extra_list)
    click_on "Edit this extra list", match: :first

    fill_in "Predikat", with: @extra_list.predikat
    click_on "Update Extra list"

    assert_text "Extra list was successfully updated"
    click_on "Back"
  end

  test "should destroy Extra list" do
    visit extra_list_url(@extra_list)
    click_on "Destroy this extra list", match: :first

    assert_text "Extra list was successfully destroyed"
  end
end
