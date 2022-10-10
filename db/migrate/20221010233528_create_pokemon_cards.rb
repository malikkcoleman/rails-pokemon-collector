class CreatePokemonCards < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_cards do |t|
      t.integer :set_id
      t.string :name
      t.string :card_number
      t.string :card_type
      t.string :rarity
      t.string :edition
      t.string :price
      t.string :image

      t.timestamps
    end
  end
end
