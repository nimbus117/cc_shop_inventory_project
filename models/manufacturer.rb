require_relative '../db/sql_runner.rb'

class Manufacturer
  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @city = options['city']
    @post_code = options['post_code']
    @phone = options['phone']
    @notes = options['notes'] if options['notes']
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
    results = SqlRunner.run sql, values
    @id = results.first['id'].to_i
  end
end
