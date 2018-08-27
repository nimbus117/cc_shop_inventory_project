require './models/inventory_item.rb'
require './models/manufacturer.rb'

get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb :"manufacturers/index"
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.get_by_id params[:id].to_i
  erb :"manufacturers/show"
end
