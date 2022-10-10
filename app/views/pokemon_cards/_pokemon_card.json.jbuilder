json.extract! pokemon_card, :id, :set_id, :name, :card_number, :card_type, :rarity, :edition, :price, :image, :created_at, :updated_at
json.url pokemon_card_url(pokemon_card, format: :json)
