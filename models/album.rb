require_relative('../db/sql_runner.rb')

class Album

  attr_reader( :id, :title, :quantity, :artist_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title, quantity, artist_id)
           VALUES($1, $2, $3)
           RETURNING id"
    values = [@title, @quantity, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map {|album| Album.new(album)}
  end

  def stock_level()
    # sql = "SELECT albums.* FROM albums WHERE quantity = $1"
    # values = [@quantity]
    # results = SqlRunner.run(sql, values).first
    # quantity = results["quantity"].to_i
    if @quantity <= 7
      return "LOW"
    elsif @quantity >= 8 && quantity <= 15
      return "MEDIUM"
    elsif @quantity > 16
      return "HIGH"
    end
  end



end
