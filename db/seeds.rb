require 'pry-byebug'
require_relative '../models/manufacturer.rb'
require_relative '../models/inventory_item.rb'

InventoryItem.delete_all
Manufacturer.delete_all

manufacturer1 = Manufacturer.new({
  'name' => "Fred's Fruits",
  'address' => '100 Some Street',
  'city' => 'Edinburgh',
  'post_code' => 'EH4 7EY',
  'phone' => '0131-332-2233',
  'notes' => 'Notes about manufacturer go here'
})
manufacturer1.save

manufacturer2 = Manufacturer.new({
  'name' => "Bob's Bananas",
  'address' => '101 Different Street',
  'city' => 'Edinburgh',
  'post_code' => 'EH4 8EY',
  'phone' => '0131-332-4444',
  'notes' => 'Notes about manufacturer go here'
})
manufacturer2.save

manufacturer3 = Manufacturer.new({
  'name' => "Betty's Berries",
  'address' => '10 Another Street',
  'city' => 'Glasgow',
  'post_code' => 'G1 1DA',
  'phone' => '0141-442-4554',
  'notes' => 'Notes about manufacturer go here'
})
manufacturer3.save

manufacturer4 = Manufacturer.new({
  'name' => "Cindy's Citruses",
  'address' => '10 Last Street',
  'city' => 'Dundee',
  'post_code' => 'DD1 1BA',
  'phone' => '0138-242-8787',
  'notes' => 'Notes about manufacturer go here'
})
manufacturer4.save

inventory_item1 = InventoryItem.new({
  'name' => 'Apples',
  'manufacturer_id' => manufacturer1.id,
  'cost_price' => 0.2,
  'sell_price' => 0.5,
  'quantity' => 20,
  'wrn_lvl' => 15,
  'crit_lvl' => 10,
  'notes' => 'notes about item go here'
})
inventory_item1.save

inventory_item2 = InventoryItem.new({
  'name' => 'Pears',
  'manufacturer_id' => manufacturer1.id,
  'cost_price' => 0.15,
  'sell_price' => 0.4,
  'quantity' => 20,
  'wrn_lvl' => 25,
  'crit_lvl' => 10
})
inventory_item2.save

inventory_item3 = InventoryItem.new({
  'name' => 'Bananas',
  'manufacturer_id' => manufacturer2.id,
  'cost_price' => 0.1,
  'sell_price' => 0.3,
  'quantity' => 35,
  'wrn_lvl' => 30,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item3.save

inventory_item4 = InventoryItem.new({
  'name' => 'Plantains',
  'manufacturer_id' => manufacturer2.id,
  'cost_price' => 0.15,
  'sell_price' => 0.3,
  'quantity' => 10,
  'wrn_lvl' => 40,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item4.save

inventory_item5 = InventoryItem.new({
  'name' => 'Strawberries',
  'manufacturer_id' => manufacturer3.id,
  'cost_price' => 0.2,
  'sell_price' => 0.3,
  'quantity' => 100,
  'wrn_lvl' => 40,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item5.save

inventory_item6 = InventoryItem.new({
  'name' => 'Raspberries',
  'manufacturer_id' => manufacturer3.id,
  'cost_price' => 0.1,
  'sell_price' => 0.15,
  'quantity' => 10,
  'wrn_lvl' => 50,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item6.save

inventory_item7 = InventoryItem.new({
  'name' => 'Blueberries',
  'manufacturer_id' => manufacturer3.id,
  'cost_price' => 0.15,
  'sell_price' => 0.3,
  'quantity' => 30,
  'wrn_lvl' => 40,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item7.save

inventory_item8 = InventoryItem.new({
  'name' => 'Blackcurrants',
  'manufacturer_id' => manufacturer3.id,
  'cost_price' => 0.12,
  'sell_price' => 0.3,
  'quantity' => 50,
  'wrn_lvl' => 50,
  'crit_lvl' => 30,
  'notes' => 'notes about item go here'
})
inventory_item8.save

inventory_item9 = InventoryItem.new({
  'name' => 'Grapes',
  'manufacturer_id' => manufacturer1.id,
  'cost_price' => 0.1,
  'sell_price' => 0.3,
  'quantity' => 100,
  'wrn_lvl' => 150,
  'crit_lvl' => 50,
  'notes' => 'notes about item go here'
})
inventory_item9.save

inventory_item10 = InventoryItem.new({
  'name' => 'Apricot',
  'manufacturer_id' => manufacturer1.id,
  'cost_price' => 0.3,
  'sell_price' => 0.5,
  'quantity' => 10,
  'wrn_lvl' => 20,
  'crit_lvl' => 5,
  'notes' => 'notes about item go here'
})
inventory_item10.save

inventory_item11 = InventoryItem.new({
  'name' => 'Cranberry',
  'manufacturer_id' => manufacturer3.id,
  'cost_price' => 0.1,
  'sell_price' => 0.2,
  'quantity' => 80,
  'wrn_lvl' => 40,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item11.save

inventory_item12 = InventoryItem.new({
  'name' => 'Grapefruit',
  'manufacturer_id' => manufacturer4.id,
  'cost_price' => 0.5,
  'sell_price' => 0.8,
  'quantity' => 5,
  'wrn_lvl' => 20,
  'crit_lvl' => 10,
  'notes' => 'notes about item go here'
})
inventory_item12.save

inventory_item13 = InventoryItem.new({
  'name' => 'Lemon',
  'manufacturer_id' => manufacturer4.id,
  'cost_price' => 0.25,
  'sell_price' => 0.4,
  'quantity' => 25,
  'wrn_lvl' => 30,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item13.save

binding.pry
nil
