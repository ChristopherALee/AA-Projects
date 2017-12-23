json.pokemon do
  json.id @pokemon.id
  json.name @pokemon.name
  json.image_url asset_path(@pokemon.image_url)
  json.item_ids @pokemon.items.map { |item| item.id }
  json.attack @pokemon.attack
  json.defense @pokemon.defense
  json.moves @pokemon.moves
  json.poke_type @pokemon.poke_type
end

json.items do
  @pokemon.items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness
      json.image_url asset_path(item.image_url)
    end
  end
end
