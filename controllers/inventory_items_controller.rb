require './models/inventory_item.rb'
require './models/manufacturer.rb'

get '/inventory' do
  @inventory = InventoryItem.all
  erb :"inventory_items/index"
end
