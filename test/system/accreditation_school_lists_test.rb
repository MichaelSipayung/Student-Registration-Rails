require "application_system_test_case"

class AccreditationSchoolListsTest < ApplicationSystemTestCase
  setup do
    @accreditation_school_list = accreditation_school_lists(:one)
  end

  test "visiting the index" do
    visit accreditation_school_lists_url
    assert_selector "h1", text: "Accreditation school lists"
  end

  test "should create accreditation school list" do
    visit accreditation_school_lists_url
    click_on "New accreditation school list"

    fill_in "Akreditasi", with: @accreditation_school_list.akreditasi
    click_on "Create Accreditation school list"

    assert_text "Accreditation school list was successfully created"
    click_on "Back"
  end

  test "should update Accreditation school list" do
    visit accreditation_school_list_url(@accreditation_school_list)
    click_on "Edit this accreditation school list", match: :first

    fill_in "Akreditasi", with: @accreditation_school_list.akreditasi
    click_on "Update Accreditation school list"

    assert_text "Accreditation school list was successfully updated"
    click_on "Back"
  end

  test "should destroy Accreditation school list" do
    visit accreditation_school_list_url(@accreditation_school_list)
    click_on "Destroy this accreditation school list", match: :first

    assert_text "Accreditation school list was successfully destroyed"
  end
end
