
require_relative( '../db/sql_runner' )

class Transaction

  attr_reader( :tags_id, :merchants_id, :transaction_value, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tags_id = options['tags_id'].to_i
    @merchants_id = options['merchants_id'].to_i
    @transaction_value = options['transaction_value'].to_i
  end

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





end
