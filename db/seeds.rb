# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'csv'
csv_text = File.read('/Users/colemancapsule/Documents/RRCWEBD3008/pokemon_collector/db/project_web_scrape/BaseSet2Unlimited.csv')
puts csv_text
CSV.foreach('/Users/colemancapsule/Documents/RRCWEBD3008/pokemon_collector/db/project_web_scrape/BaseSet2Unlimited.csv', headers: true) do |row|
  PokemonCard.create({
    name: row["name"],
    card_number: row["card_number"],
    card_type: row["type"],
    rarity: row["rarity"],
    edition: row["edition"],
    price: row["price"],
    image: row["image"],
    pokemon_set_id: row["set_id"]
  })

  end