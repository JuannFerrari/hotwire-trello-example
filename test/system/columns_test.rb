require "application_system_test_case"

class ColumnsTest < ApplicationSystemTestCase
  setup do
    @column = columns(:one)
  end

  test "visiting the index" do
    visit columns_url
    assert_selector "h1", text: "Columns"
  end

  test "should create column" do
    visit columns_url
    click_on "New column"

    fill_in "Board", with: @column.board_id
    fill_in "Name", with: @column.name
    click_on "Create Column"

    assert_text "Column was successfully created"
    click_on "Back"
  end

  test "should update Column" do
    visit column_url(@column)
    click_on "Edit this column", match: :first

    fill_in "Board", with: @column.board_id
    fill_in "Name", with: @column.name
    click_on "Update Column"

    assert_text "Column was successfully updated"
    click_on "Back"
  end

  test "should destroy Column" do
    visit column_url(@column)
    click_on "Destroy this column", match: :first

    assert_text "Column was successfully destroyed"
  end
end
