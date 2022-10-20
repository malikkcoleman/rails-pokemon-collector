class PokemonCard < ApplicationRecord
  belongs_to :pokemon_sets

  validates :name, :card_number, :card_type, :image, presence:true

  paginates_per 20

end
