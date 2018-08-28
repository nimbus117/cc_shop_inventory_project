require 'sinatra'
require 'sinatra/contrib/all'
require_relative './controllers/inventory_items_controller.rb'
require_relative './controllers/manufacturers_controller.rb'
also_reload './models/*'

get '/' do
  @low_stock = InventoryItem.get_low_stock
  sorted_items = InventoryItem.all.sort_by {|item| item.markup}
  @most_profitable = sorted_items.reverse.first(5)
  erb :index
end
