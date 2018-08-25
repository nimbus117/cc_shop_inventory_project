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
  'address' => '101 Some Street',
  'city' => 'Edinburgh',
  'post_code' => 'EH4 8EY',
  'phone' => '0131-332-4444'
})
manufacturer2.save

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
  'quantity' => 10,
  'wrn_lvl' => 40,
  'crit_lvl' => 20,
  'notes' => 'notes about item go here'
})
inventory_item3.save

binding.pry
nil
