require_relative('../db/sql_runner.rb')

class Album

  attr_reader( :id)
  attr_accessor( :title, :quantity, :artist_id, :genre_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
    @genre_id = options['genre_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title, quantity, artist_id, genre_id)
           VALUES($1, $2, $3, $4)
           RETURNING id"
    values = [@title, @quantity, @artist_id, @genre_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map {|album| Album.new(album)}
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)
    results = Album.new(album.first)
    return results
  end

  def stock_level()
    # sql = "SELECT albums.* FROM albums WHERE quantity = $1"
    # values = [@quantity]
    # results = SqlRunner.run(sql, values).first
    # quantity = results["quantity"].to_i
    if @quantity <= 7
      return "LOW"
    elsif @quantity >= 8 && @quantity <= 15
      return "MEDIUM"
    elsif @quantity > 16
      return "HIGH"
    end
  end

    def self.delete_all()
      sql = "DELETE FROM albums"
      values = []
      SqlRunner.run(sql, values)
    end

    def self.delete(id)
      sql = "DELETE FROM albums WHERE id = $1"
      values = [id]
      SqlRunner.run(sql, values)
    end

    def update()
      sql = "UPDATE albums SET(title, quantity) = ($1, $2) WHERE id = $3"
      values = [@title, @quantity, @id]
      SqlRunner.run(sql, values)
    end



end
