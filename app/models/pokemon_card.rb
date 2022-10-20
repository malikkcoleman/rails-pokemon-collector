class PokemonCard < ApplicationRecord
  belongs_to :pokemon_sets

  validates :name, :card_number, :card_type, :image, presence:true

  paginates_per 20

  def self.search(search)
    if search
      @pokemon_cards = PokemonCard.find(card_type: search)
    else
      @pokemon_cards = PokemonCard.all
    end
  end
end
