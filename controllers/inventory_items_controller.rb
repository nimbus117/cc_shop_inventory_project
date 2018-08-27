require './models/inventory_item.rb'
require './models/manufacturer.rb'

get '/inventory' do
  @inventory = InventoryItem.all
  erb :"inventory_items/index"
end

get '/inventory/:id' do
  @item = InventoryItem.get_by_id params[:id].to_i
  erb :"inventory_items/show"
end
