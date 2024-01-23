require "application_system_test_case"

class HighSchoolMajorsTest < ApplicationSystemTestCase
  setup do
    @high_school_major = high_school_majors(:one)
  end

  test "visiting the index" do
    visit high_school_majors_url
    assert_selector "h1", text: "High school majors"
  end

  test "should create high school major" do
    visit high_school_majors_url
    click_on "New high school major"

    fill_in "Jurusan", with: @high_school_major.jurusan
    click_on "Create High school major"

    assert_text "High school major was successfully created"
    click_on "Back"
  end

  test "should update High school major" do
    visit high_school_major_url(@high_school_major)
    click_on "Edit this high school major", match: :first

    fill_in "Jurusan", with: @high_school_major.jurusan
    click_on "Update High school major"

    assert_text "High school major was successfully updated"
    click_on "Back"
  end

  test "should destroy High school major" do
    visit high_school_major_url(@high_school_major)
    click_on "Destroy this high school major", match: :first

    assert_text "High school major was successfully destroyed"
  end
end
