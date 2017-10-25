require_relative('../db/sql_runner.rb')

class Artist

  attr_reader( :id)
  attr_accessor( :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists(name)
           VALUES($1)
           RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map {|artist| Artist.new(artist)}
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    artist = results.map {|artist| Artist.new(artist)}
    return artist.first
  end

  def self.albums(id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [id]
    SqlRunner.run(sql, values).map{|album| Album.new(album)}
  end

  def self.delete(id)
    if self.albums(id).length > 0
      return false
    end
      sql = "DELETE FROM artists WHERE id = $1"
      values = [id]
      SqlRunner.run(sql, values)
      return true
  end

  def update()
    sql = "UPDATE artists SET(name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end
end
