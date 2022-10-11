class RemoveSeriesIdFromPokemonSets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemon_sets, :series_id, :integer
  end
end
