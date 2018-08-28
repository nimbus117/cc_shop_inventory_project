require 'sinatra'
require 'sinatra/contrib/all'
require_relative './controllers/inventory_items_controller.rb'
require_relative './controllers/manufacturers_controller.rb'
also_reload './models/*'

get '/' do
  @low_stock = InventoryItem.get_low_stock
  erb :index
end
