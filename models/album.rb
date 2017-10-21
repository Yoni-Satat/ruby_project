require_relative('../db/sql_runner.rb')

class Album

  attr_reader( :id, :title, :quantity)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums(name)
           VALUES($1, $2, $3)
           RETURNING id"
    values = [@title, @quantity, @artist_id]
    rssults = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
end
