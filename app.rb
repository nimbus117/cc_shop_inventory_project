require 'sinatra'
require 'sinatra/contrib/all'
require_relative './controllers/inventory_items_controller.rb'
also_reload './models/*'

get '/' do
  erb :index
end
