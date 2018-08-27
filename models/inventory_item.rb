require_relative '../db/sql_runner.rb'

class InventoryItem
  attr_accessor :name, :manufacturer_id, :cost_price, :sell_price, :quantity, :notes, :crit_lvl, :wrn_lvl
  attr_reader :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @manufacturer_id = options['manufacturer_id'].to_i
    @cost_price = options['cost_price'].to_f
    @sell_price = options['sell_price'].to_f
    @quantity = options['quantity'].to_i
    @wrn_lvl = options['wrn_lvl'].to_i
    @crit_lvl = options['crit_lvl'].to_i
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
        wrn_lvl,
        crit_lvl,
        notes
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6, $7, $8
      )
      RETURNING id
    '
    values = [
      @name,
      @manufacturer_id,
      @cost_price,
      @sell_price,
      @quantity,
      @wrn_lvl,
      @crit_lvl,
      @notes
    ]
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
        wrn_lvl,
        crit_lvl,
        notes
      ) = (
        $1, $2, $3, $4, $5, $6, $7, $8
      )
      WHERE id = $9
    '
    values = [
      @name,
      @manufacturer_id,
      @cost_price,
      @sell_price,
      @quantity,
      @wrn_lvl,
      @crit_lvl,
      @notes,
      @id
    ]
    SqlRunner.run sql, values
  end

  def delete
    sql = 'DELETE FROM inventory_items WHERE id = $1'
    values = [@id]
    SqlRunner.run sql, values
  end

  def manufacturer
    sql = 'SELECT * FROM manufacturers WHERE id = $1'
    values = [@manufacturer_id]
    result = SqlRunner.run sql, values
    Manufacturer.new result[0]
  end

  def markup
    ((@sell_price / @cost_price) - 1).round(2)
  end

  def quantity_lvl
    if @quantity <= @crit_lvl
      'quantity_critical'
    elsif @quantity <= @wrn_lvl
      'quantity_warning'
    else
      'quantity_ok'
    end
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

  def InventoryItem.delete_all
    sql = 'DELETE FROM inventory_items'
    SqlRunner.run sql
  end

  def InventoryItem.get_by_id id
    sql = '
      SELECT *
      FROM inventory_items
      WHERE id = $1
    '
    values = [id]
    result = SqlRunner.run sql, values
    InventoryItem.new result[0]
  end

  def InventoryItem.delete_by_id id
    sql = '
      DELETE FROM inventory_items
      WHERE id = $1
    '
    values = [id]
    SqlRunner.run sql, values
  end

  def InventoryItem.get_by_manufacturer_id id
    sql = '
      SELECT
        I.*
      FROM
        inventory_items AS I
      INNER JOIN
        manufacturers AS M
      ON
        I.manufacturer_id = M.id
      WHERE
        M.id = $1
    '
    values = [id]
    result = SqlRunner.run sql, values
    InventoryItem.map_items result
  end
end
