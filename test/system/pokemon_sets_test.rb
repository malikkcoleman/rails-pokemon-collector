require "application_system_test_case"

class PokemonSetsTest < ApplicationSystemTestCase
  setup do
    @pokemon_set = pokemon_sets(:one)
  end

  test "visiting the index" do
    visit pokemon_sets_url
    assert_selector "h1", text: "Pokemon sets"
  end

  test "should create pokemon set" do
    visit pokemon_sets_url
    click_on "New pokemon set"

    fill_in "Image", with: @pokemon_set.image
    fill_in "Name", with: @pokemon_set.name
    fill_in "Series", with: @pokemon_set.series_id
    click_on "Create Pokemon set"

    assert_text "Pokemon set was successfully created"
    click_on "Back"
  end

  test "should update Pokemon set" do
    visit pokemon_set_url(@pokemon_set)
    click_on "Edit this pokemon set", match: :first

    fill_in "Image", with: @pokemon_set.image
    fill_in "Name", with: @pokemon_set.name
    fill_in "Series", with: @pokemon_set.series_id
    click_on "Update Pokemon set"

    assert_text "Pokemon set was successfully updated"
    click_on "Back"
  end

  test "should destroy Pokemon set" do
    visit pokemon_set_url(@pokemon_set)
    click_on "Destroy this pokemon set", match: :first

    assert_text "Pokemon set was successfully destroyed"
  end
end
