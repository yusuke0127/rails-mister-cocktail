# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Deleting all ingredients"

Ingredient.delete_all

puts 'Getting the API for the ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json_serialized = open(url).read
ingredients_json = JSON.parse(json_serialized)
# puts json_serialized
ingredients = ingredients_json['drinks']

# puts ingredients
# ingredients.each do |ingredient|
#   puts ingredient["strIngredient1"]
# end
# puts 'Creating ingredients'

ingredients.each do |ingredient|
  Ingredient.create(
    name: ingredient['strIngredient1']
  )
end

puts "Created #{Ingredient.count} ingredients"

# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# cocktail = Cocktail.new(title: 'NES', body: "A great console")
# cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
