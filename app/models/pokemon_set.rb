class PokemonSet < ApplicationRecord

  belongs_to :series

  validates :name, :image, presence:true
end
