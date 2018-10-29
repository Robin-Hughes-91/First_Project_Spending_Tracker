
require_relative( '../db/sql_runner' )

class Tag

  attr_reader(:id)
  attr_accessor( :tag_name, :tag_logo)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tag_name = options['tag_name']
    @tag_logo = options['tag_logo']
  end

  #CRUD FUNCTIONS
  def save()
    sql = "INSERT INTO tags
    (
      tag_name,
      tag_logo
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@tag_name, @tag_logo]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tags SET (tag_name, tag_logo) = ($1, $2) WHERE id = $3"
    values = [@tag_name, @tag_logo, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run( sql )
    return results.map { |hash| Tag.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Tag.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM tags
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end


  def delete()
    sql = "DELETE FROM tags where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # ADDITIONAL FUNCTIONS

  def merchant()
    sql = "SELECT merchants.*
    FROM merchants
    INNER JOIN transactions
    ON transactions.merchants_id = merchants.id
    WHERE tags_id = $1"
    values = [@id]
    merchant = SqlRunner.run(sql, values)
    result = merchant.map {|merchant| Merchant.new(merchant)}
    return result.first
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE tags_id = $1"
    values = [@id]
    transaction = SqlRunner.run( sql, values )
    result = transaction.map{ |transaction| Transaction.new(transaction)}
    return result
  end

  def transaction_total

    sql = "SELECT * FROM transactions WHERE tags_id = $1"
    values = [@id]
    transaction = SqlRunner.run( sql, values )
    result = transaction.map{ |transaction| Transaction.new(transaction)}
    total = result.map{|transaction| transaction.transaction_value}
    combined_total = total.sum
    return combined_total
  end











end
