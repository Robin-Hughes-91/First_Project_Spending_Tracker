
require_relative( '../db/sql_runner' )

class Merchant

  attr_reader(:id)
  attr_accessor( :merchant_name, :merchant_logo, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
    @merchant_logo = options['merchant_logo']
  end

  #CRUD FUNCTIONS
  def save()
    sql = "INSERT INTO merchants
    (
      merchant_name,
      merchant_logo

    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@merchant_name, @merchant_logo]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE merchants SET (merchant_name, merchant_logo) = ($1, $2) WHERE id = $3"
    values = [@merchant_name, @merchant_logo, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run( sql )
    return results.map { |hash| Merchant.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Merchant.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end


  def delete()
    sql = "DELETE FROM merchants where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #ADDITIONAL FUNCTIONS

  def tag()
    sql = "SELECT tags.*
    FROM tags
    INNER JOIN transactions
    ON transactions.tags_id = tags.id
    WHERE merchants_id = $1"
    values = [@id]
    tags = SqlRunner.run(sql, values)
    result = tags.map {|tag| Tag.new(tag)}
    return result.first
  end

  def transactions()
  sql = "SELECT * FROM transactions WHERE merchants_id = $1"
  values = [@id]
  transaction = SqlRunner.run( sql, values )
  result = transaction.map{ |transaction| Transaction.new(transaction)}
  return result
  end

  def transaction_total

  sql = "SELECT * FROM transactions WHERE merchants_id = $1"
  values = [@id]
  transaction = SqlRunner.run( sql, values )
  result = transaction.map{ |transaction| Transaction.new(transaction)}
  total = result.map{|transaction| transaction.transaction_value}
  combined_total = total.sum
  return combined_total
  end










end
