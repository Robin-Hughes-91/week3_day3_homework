require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :artist, :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)

    @artist = options['artist']
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      artist,
      title,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@artist, @title, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def update()
    sql = "
    UPDATE albums SET (
      artist,
      title,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@artist, @title, @genre, @artist_id, @id]
    SqlRunner.run(sql,values)
  end

  def delete(id)
    sql = "DELETE FROM albums where id = $1"
    values = [id]
    SqlRunner.run(sql,values)



  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    # multiple here so we need map
    artists = results.map{|artist| Artist.new(artist)}
    return artists
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql )
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql )
    return albums.map { |album| Album.new(album) }
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)
    result = Artist.new(artist.first)
    return result
  end

end
