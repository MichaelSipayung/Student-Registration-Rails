require "application_system_test_case"

class ParentJobListsTest < ApplicationSystemTestCase
  setup do
    @parent_job_list = parent_job_lists(:one)
  end

  test "visiting the index" do
    visit parent_job_lists_url
    assert_selector "h1", text: "Parent job lists"
  end

  test "should create parent job list" do
    visit parent_job_lists_url
    click_on "New parent job list"

    fill_in "Pekerjaan", with: @parent_job_list.pekerjaan
    click_on "Create Parent job list"

    assert_text "Parent job list was successfully created"
    click_on "Back"
  end

  test "should update Parent job list" do
    visit parent_job_list_url(@parent_job_list)
    click_on "Edit this parent job list", match: :first

    fill_in "Pekerjaan", with: @parent_job_list.pekerjaan
    click_on "Update Parent job list"

    assert_text "Parent job list was successfully updated"
    click_on "Back"
  end

  test "should destroy Parent job list" do
    visit parent_job_list_url(@parent_job_list)
    click_on "Destroy this parent job list", match: :first

    assert_text "Parent job list was successfully destroyed"
  end
end
