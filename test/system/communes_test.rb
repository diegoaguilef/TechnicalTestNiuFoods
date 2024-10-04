require "application_system_test_case"

class CommunesTest < ApplicationSystemTestCase
  setup do
    @commune = communes(:one)
  end

  test "visiting the index" do
    visit communes_url
    assert_selector "h1", text: "Communes"
  end

  test "should create commune" do
    visit communes_url
    click_on "New commune"

    fill_in "City", with: @commune.city_id
    fill_in "Name", with: @commune.name
    click_on "Create Commune"

    assert_text "Commune was successfully created"
    click_on "Back"
  end

  test "should update Commune" do
    visit commune_url(@commune)
    click_on "Edit this commune", match: :first

    fill_in "City", with: @commune.city_id
    fill_in "Name", with: @commune.name
    click_on "Update Commune"

    assert_text "Commune was successfully updated"
    click_on "Back"
  end

  test "should destroy Commune" do
    visit commune_url(@commune)
    click_on "Destroy this commune", match: :first

    assert_text "Commune was successfully destroyed"
  end
end
