class AddSeriesRefToPokemonSets < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemon_sets, :series, null: false, foreign_key: true
  end
end
