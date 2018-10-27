
require_relative( '../db/sql_runner' )

class Tag

  attr_reader( :tag_name, :tag_logo, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tag_name = options['tag_name']
    @tag_logo = options['tag_logo']
  end

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











end
