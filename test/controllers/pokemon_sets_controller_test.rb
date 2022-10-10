require "test_helper"

class PokemonSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_set = pokemon_sets(:one)
  end

  test "should get index" do
    get pokemon_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_set_url
    assert_response :success
  end

  test "should create pokemon_set" do
    assert_difference("PokemonSet.count") do
      post pokemon_sets_url, params: { pokemon_set: { image: @pokemon_set.image, name: @pokemon_set.name, series_id: @pokemon_set.series_id } }
    end

    assert_redirected_to pokemon_set_url(PokemonSet.last)
  end

  test "should show pokemon_set" do
    get pokemon_set_url(@pokemon_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_set_url(@pokemon_set)
    assert_response :success
  end

  test "should update pokemon_set" do
    patch pokemon_set_url(@pokemon_set), params: { pokemon_set: { image: @pokemon_set.image, name: @pokemon_set.name, series_id: @pokemon_set.series_id } }
    assert_redirected_to pokemon_set_url(@pokemon_set)
  end

  test "should destroy pokemon_set" do
    assert_difference("PokemonSet.count", -1) do
      delete pokemon_set_url(@pokemon_set)
    end

    assert_redirected_to pokemon_sets_url
  end
end
