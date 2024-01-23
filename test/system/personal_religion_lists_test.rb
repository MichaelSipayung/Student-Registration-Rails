require "application_system_test_case"

class PersonalReligionListsTest < ApplicationSystemTestCase
  setup do
    @personal_religion_list = personal_religion_lists(:one)
  end

  test "visiting the index" do
    visit personal_religion_lists_url
    assert_selector "h1", text: "Personal religion lists"
  end

  test "should create personal religion list" do
    visit personal_religion_lists_url
    click_on "New personal religion list"

    fill_in "Agama", with: @personal_religion_list.agama
    click_on "Create Personal religion list"

    assert_text "Personal religion list was successfully created"
    click_on "Back"
  end

  test "should update Personal religion list" do
    visit personal_religion_list_url(@personal_religion_list)
    click_on "Edit this personal religion list", match: :first

    fill_in "Agama", with: @personal_religion_list.agama
    click_on "Update Personal religion list"

    assert_text "Personal religion list was successfully updated"
    click_on "Back"
  end

  test "should destroy Personal religion list" do
    visit personal_religion_list_url(@personal_religion_list)
    click_on "Destroy this personal religion list", match: :first

    assert_text "Personal religion list was successfully destroyed"
  end
end
