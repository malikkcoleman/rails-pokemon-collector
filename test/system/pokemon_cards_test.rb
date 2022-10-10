require "application_system_test_case"

class PokemonCardsTest < ApplicationSystemTestCase
  setup do
    @pokemon_card = pokemon_cards(:one)
  end

  test "visiting the index" do
    visit pokemon_cards_url
    assert_selector "h1", text: "Pokemon cards"
  end

  test "should create pokemon card" do
    visit pokemon_cards_url
    click_on "New pokemon card"

    fill_in "Card number", with: @pokemon_card.card_number
    fill_in "Card type", with: @pokemon_card.card_type
    fill_in "Edition", with: @pokemon_card.edition
    fill_in "Image", with: @pokemon_card.image
    fill_in "Name", with: @pokemon_card.name
    fill_in "Price", with: @pokemon_card.price
    fill_in "Rarity", with: @pokemon_card.rarity
    fill_in "Set", with: @pokemon_card.set_id
    click_on "Create Pokemon card"

    assert_text "Pokemon card was successfully created"
    click_on "Back"
  end

  test "should update Pokemon card" do
    visit pokemon_card_url(@pokemon_card)
    click_on "Edit this pokemon card", match: :first

    fill_in "Card number", with: @pokemon_card.card_number
    fill_in "Card type", with: @pokemon_card.card_type
    fill_in "Edition", with: @pokemon_card.edition
    fill_in "Image", with: @pokemon_card.image
    fill_in "Name", with: @pokemon_card.name
    fill_in "Price", with: @pokemon_card.price
    fill_in "Rarity", with: @pokemon_card.rarity
    fill_in "Set", with: @pokemon_card.set_id
    click_on "Update Pokemon card"

    assert_text "Pokemon card was successfully updated"
    click_on "Back"
  end

  test "should destroy Pokemon card" do
    visit pokemon_card_url(@pokemon_card)
    click_on "Destroy this pokemon card", match: :first

    assert_text "Pokemon card was successfully destroyed"
  end
end
