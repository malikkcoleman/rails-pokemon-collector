class CreatePokemonSets < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_sets do |t|
      t.integer :series_id
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
