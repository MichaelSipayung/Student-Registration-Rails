require "application_system_test_case"

class PmdkSchoolListsTest < ApplicationSystemTestCase
  setup do
    @pmdk_school_list = pmdk_school_lists(:one)
  end

  test "visiting the index" do
    visit pmdk_school_lists_url
    assert_selector "h1", text: "Pmdk school lists"
  end

  test "should create pmdk school list" do
    visit pmdk_school_lists_url
    click_on "New pmdk school list"

    fill_in "Sekolah", with: @pmdk_school_list.sekolah
    click_on "Create Pmdk school list"

    assert_text "Pmdk school list was successfully created"
    click_on "Back"
  end

  test "should update Pmdk school list" do
    visit pmdk_school_list_url(@pmdk_school_list)
    click_on "Edit this pmdk school list", match: :first

    fill_in "Sekolah", with: @pmdk_school_list.sekolah
    click_on "Update Pmdk school list"

    assert_text "Pmdk school list was successfully updated"
    click_on "Back"
  end

  test "should destroy Pmdk school list" do
    visit pmdk_school_list_url(@pmdk_school_list)
    click_on "Destroy this pmdk school list", match: :first

    assert_text "Pmdk school list was successfully destroyed"
  end
end
