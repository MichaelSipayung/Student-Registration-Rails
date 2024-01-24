require "application_system_test_case"

class BatchListsTest < ApplicationSystemTestCase
  setup do
    @batch_list = batch_lists(:one)
  end

  test "visiting the index" do
    visit batch_lists_url
    assert_selector "h1", text: "Batch lists"
  end

  test "should create batch list" do
    visit batch_lists_url
    click_on "New batch list"

    check "Aktif" if @batch_list.aktif
    fill_in "Gelombang", with: @batch_list.gelombang
    click_on "Create Batch list"

    assert_text "Batch list was successfully created"
    click_on "Back"
  end

  test "should update Batch list" do
    visit batch_list_url(@batch_list)
    click_on "Edit this batch list", match: :first

    check "Aktif" if @batch_list.aktif
    fill_in "Gelombang", with: @batch_list.gelombang
    click_on "Update Batch list"

    assert_text "Batch list was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch list" do
    visit batch_list_url(@batch_list)
    click_on "Destroy this batch list", match: :first

    assert_text "Batch list was successfully destroyed"
  end
end
