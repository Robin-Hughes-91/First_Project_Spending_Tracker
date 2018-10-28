
require_relative( '../db/sql_runner' )

class Transaction

  attr_reader(:id)
  attr_accessor( :tags_id, :merchants_id, :transaction_value, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tags_id = options['tags_id'].to_i
    @merchants_id = options['merchants_id'].to_i
    @transaction_value = options['transaction_value'].to_i
  end

#CRUD FUNCTIONS
  def save()
    sql = "INSERT INTO transactions
    (
      tags_id,
      merchants_id,
      transaction_value
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@tags_id, @merchants_id, @transaction_value]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Transaction.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Transaction.new( results.first )
  end

  def update()
    sql = "UPDATE transactions SET (tags_id, merchants_id, transaction_value) = ($1, $2, $3) WHERE id = $4"
    values = [@tags_id, @merchants_id, @transaction_value, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM transactions where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # ADDITIONAL FUNCTIONS

  # def tags()
  # sql = "SELECT * FROM tags
  # WHERE id = $1"
  # values = [@tags_id]
  # results = SqlRunner.run( sql, values )
  # return Tag.new( results.first )
  # end
  #
  # def merchants()
  # sql = "SELECT * FROM merchants
  # WHERE id = $1"
  # values = [@merchants_id]
  # results = SqlRunner.run( sql, values )
  # return Merchant.new( results.first )
  # end

  def tags()
  sql = "SELECT * FROM tags WHERE tags.id = $1"
  values = [@tags_id]
  tag = SqlRunner.run( sql, values )
  result = tag.map{ |tag| Tag.new(tag)}
  return result[0]
  end

  def merchants()
  sql = "SELECT * FROM merchants WHERE merchants.id = $1"
  values = [@merchants_id]
  merchant = SqlRunner.run( sql, values )
  result = merchant.map{ |merchant| Merchant.new(merchant)}
  return result[0]
  end

  def self.transaction_total
  transactions = self.all()
  film_fees = transactions.map{|transaction| transaction.transaction_value}
  combined_fees = film_fees.sum
  return combined_fees
  end






end
