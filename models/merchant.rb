
require_relative( '../db/sql_runner' )

class Merchant

  attr_reader( :merchant_name, :merchant_logo, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
    @merchant_logo = options['merchant_logo']
  end

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









end 
