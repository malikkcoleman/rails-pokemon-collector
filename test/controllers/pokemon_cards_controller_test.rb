require "test_helper"

class PokemonCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_card = pokemon_cards(:one)
  end

  test "should get index" do
    get pokemon_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_card_url
    assert_response :success
  end

  test "should create pokemon_card" do
    assert_difference("PokemonCard.count") do
      post pokemon_cards_url, params: { pokemon_card: { card_number: @pokemon_card.card_number, card_type: @pokemon_card.card_type, edition: @pokemon_card.edition, image: @pokemon_card.image, name: @pokemon_card.name, price: @pokemon_card.price, rarity: @pokemon_card.rarity, set_id: @pokemon_card.set_id } }
    end

    assert_redirected_to pokemon_card_url(PokemonCard.last)
  end

  test "should show pokemon_card" do
    get pokemon_card_url(@pokemon_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_card_url(@pokemon_card)
    assert_response :success
  end

  test "should update pokemon_card" do
    patch pokemon_card_url(@pokemon_card), params: { pokemon_card: { card_number: @pokemon_card.card_number, card_type: @pokemon_card.card_type, edition: @pokemon_card.edition, image: @pokemon_card.image, name: @pokemon_card.name, price: @pokemon_card.price, rarity: @pokemon_card.rarity, set_id: @pokemon_card.set_id } }
    assert_redirected_to pokemon_card_url(@pokemon_card)
  end

  test "should destroy pokemon_card" do
    assert_difference("PokemonCard.count", -1) do
      delete pokemon_card_url(@pokemon_card)
    end

    assert_redirected_to pokemon_cards_url
  end
end
