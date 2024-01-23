require "application_system_test_case"

class OrganizationDegreeListsTest < ApplicationSystemTestCase
  setup do
    @organization_degree_list = organization_degree_lists(:one)
  end

  test "visiting the index" do
    visit organization_degree_lists_url
    assert_selector "h1", text: "Organization degree lists"
  end

  test "should create organization degree list" do
    visit organization_degree_lists_url
    click_on "New organization degree list"

    fill_in "Jabatan", with: @organization_degree_list.jabatan
    click_on "Create Organization degree list"

    assert_text "Organization degree list was successfully created"
    click_on "Back"
  end

  test "should update Organization degree list" do
    visit organization_degree_list_url(@organization_degree_list)
    click_on "Edit this organization degree list", match: :first

    fill_in "Jabatan", with: @organization_degree_list.jabatan
    click_on "Update Organization degree list"

    assert_text "Organization degree list was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization degree list" do
    visit organization_degree_list_url(@organization_degree_list)
    click_on "Destroy this organization degree list", match: :first

    assert_text "Organization degree list was successfully destroyed"
  end
end
