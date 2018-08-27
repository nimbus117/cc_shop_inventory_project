require './models/inventory_item.rb'
require './models/manufacturer.rb'

get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb :"manufacturers/index"
end

get '/manufacturers/new' do
  erb :"manufacturers/new"
end

post '/manufacturers/new' do
  new_manufacturer = Manufacturer.new(params)
  new_manufacturer.save
  redirect to "/manufacturers/#{new_manufacturer.id}"
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.get_by_id params[:id].to_i
  erb :"manufacturers/show"
end
