class RemoveSetIdFromPokemonCards < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemon_cards, :set_id, :integer
  end
end
