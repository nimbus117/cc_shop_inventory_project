require_relative '../db/sql_runner.rb'

class Manufacturer
  attr_accessor :name, :address, :city, :post_code, :phone, :notes
  attr_reader :id

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @city = options['city']
    @post_code = options['post_code']
    @phone = options['phone']
    @notes = options['notes'] || ''
  end

  def save
    sql = '
      INSERT INTO manufacturers
      (
        name,
        address,
        city,
        post_code,
        phone,
        notes
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6
      )
      RETURNING id
    '
    values = [@name, @address, @city, @post_code, @phone, @notes]
    result = SqlRunner.run sql, values
    @id = result.first['id'].to_i
  end

  def update
    sql = '
      UPDATE
        manufacturers
      SET
      (
        name,
        address,
        city,
        post_code,
        phone,
        notes
      ) = (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7
    '
    values = [@name, @address, @city, @post_code, @phone, @notes, @id]
    SqlRunner.run sql, values
  end

  def delete
    sql = 'DELETE FROM manufacturers WHERE id = $1'
    values = [@id]
    SqlRunner.run sql, values
  end

  def Manufacturer.map_items manufacturer_data
    manufacturer_data.map do |manufacturer|
      Manufacturer.new manufacturer
    end
  end

  def Manufacturer.all
    sql = 'SELECT * FROM manufacturers'
    result = SqlRunner.run sql
    Manufacturer.map_items result
  end

  def Manufacturer.delete_all
    sql = 'DELETE FROM manufacturers'
    SqlRunner.run sql
  end

  def Manufacturer.get_by_id id
    sql = '
      SELECT *
      FROM manufacturers
      WHERE id = $1
    '
    values = [id]
    result = SqlRunner.run sql, values
    Manufacturer.new result[0]
  end

  def Manufacturer.delete_by_id id
    sql = '
      DELETE FROM manufacturers
      WHERE id = $1
    '
    values = [id]
    SqlRunner.run sql, values
  end
end
