require 'pry-byebug'
require_relative '../models/manufacturer.rb'

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

binding.pry
nil
