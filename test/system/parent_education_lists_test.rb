require "application_system_test_case"

class ParentEducationListsTest < ApplicationSystemTestCase
  setup do
    @parent_education_list = parent_education_lists(:one)
  end

  test "visiting the index" do
    visit parent_education_lists_url
    assert_selector "h1", text: "Parent education lists"
  end

  test "should create parent education list" do
    visit parent_education_lists_url
    click_on "New parent education list"

    fill_in "Pendidikan", with: @parent_education_list.pendidikan
    click_on "Create Parent education list"

    assert_text "Parent education list was successfully created"
    click_on "Back"
  end

  test "should update Parent education list" do
    visit parent_education_list_url(@parent_education_list)
    click_on "Edit this parent education list", match: :first

    fill_in "Pendidikan", with: @parent_education_list.pendidikan
    click_on "Update Parent education list"

    assert_text "Parent education list was successfully updated"
    click_on "Back"
  end

  test "should destroy Parent education list" do
    visit parent_education_list_url(@parent_education_list)
    click_on "Destroy this parent education list", match: :first

    assert_text "Parent education list was successfully destroyed"
  end
end
