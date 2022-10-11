class AddPokemonSetsRefToPokemonCards < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemon_cards, :pokemon_set, null: false, foreign_key: true
  end
end
