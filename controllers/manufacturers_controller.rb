require './models/inventory_item.rb'
require './models/manufacturer.rb'

get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb :"manufacturers/index"
end
