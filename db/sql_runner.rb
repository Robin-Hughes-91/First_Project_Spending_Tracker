require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'spending_tracker', host: 'localhost' }) //use for local db not heroku
      PG.connect( {dbname: 'dbu9iktnfng3fd',
        host: 'ec2-54-217-223-175.eu-west-1.compute.amazonaws.com',
        port: 5432, user: 'fhxbfksksvpmeo', password: '90503da12a7e20c501f6defbdacc675f2a62aeb08e9b5aef9cfabc57d33a4d55'})
        db.prepare("query", sql)
        result = db.exec_prepared( "query", values )
      ensure
        db.close() if db != nil
      end
      return result
    end

  end
