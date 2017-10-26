require_relative('../db/sql_runner.rb')

class Genre
  attr_reader( :id)
  attr_accessor( :type)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO genres(type)
           VALUES($1)
           RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM genres"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map {|genre| Genre.new(genre)}
  end

  def self.find(id)
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    genre = results.map {|genre| Genre.new(genre)}
    return genre.first
  end

  def self.albums(id)
    sql = "SELECT * FROM albums WHERE genre_id = $1"
    values = [id]
    SqlRunner.run(sql, values).map{|album| Album.new(album)}
  end

  def self.delete(id)
    if self.albums(id).length > 0
      return false
    end
    sql = "DELETE FROM genres WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
    return true
  end

  def update()
    sql = "UPDATE genres SET(type) = ($1) WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end
end
