require_relative '../db/sql_runner.rb'

class InventoryItem
  attr_accessor :name, :manufacturer_id, :cost_price, :sell_price, :quantity, :notes
  attr_reader :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @manufacturer_id = options['manufacturer_id']
    @cost_price = options['cost_price']
    @sell_price = options['sell_price']
    @quantity = options['quantity']
    @notes = options['notes'] || ''
  end

  def save
    sql = '
      INSERT INTO inventory_items
      (
        name,
        manufacturer_id,
        cost_price,
        sell_price,
        quantity,
        notes
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6
      )
      RETURNING id
    '
    values = [@name, @manufacturer_id, @cost_price, @sell_price, @quantity, @notes]
    result = SqlRunner.run sql, values
    @id = result.first['id'].to_i
  end

  def update
    sql = '
      UPDATE
        inventory_items
      SET
      (
        name,
        manufacturer_id,
        cost_price,
        sell_price,
        quantity,
        notes
      ) = (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7
    '
    values = [@name, @manufacturer_id, @cost_price, @sell_price, @quantity, @notes, @id]
    SqlRunner.run sql, values
  end

  def delete
    sql = 'DELETE FROM inventory_items WHERE id = $1'
    values = [@id]
    SqlRunner.run sql, values
  end

  def InventoryItem.map_items item_data
    item_data.map do |item|
      InventoryItem.new item
    end
  end

  def InventoryItem.all
    sql = 'SELECT * FROM inventory_items'
    result = SqlRunner.run sql
    InventoryItem.map_items result
  end

end
