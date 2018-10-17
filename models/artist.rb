require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
      ) VALUES
      (
        $1
      )
      RETURNING id"
      values = [@name]
      result = SqlRunner.run(sql, values)
      @id = result[0]["id"].to_i
    end

    # ^^comes back in array so we open up array giving
    # hash then we drill down into hash to accesss
    # the id string then we convert to integer
    def self.delete_all()
      sql = "DELETE FROM artists"
      result = SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM artists"
      artists = SqlRunner.run(sql)
      return artist.map{ |artist| Artist.new(artist)}
    end

    def self.find(id)
      sql = 'SELECT * FROM artists where id = $1'
      values = [id]
      results = SqlRunner.run(sql, values)
      # multiple here so we need map
      albums = results.map{|album| Album.new(album)}
      return albums
    end

    def albums()
      sql = "SELECT * FROM albums WHERE artist_id = $1"
      values = [@id]
      albums = SqlRunner.run(sql, values)

      result = albums.map{|album| Album.new(album)}
      return result
    end

    def update()
      sql = "
      UPDATE artists SET (
        name
      ) VALUES
      (
        $1
      )
      WHERE id = $1"
      values = [@name]
      SqlRunner.run(sql,values)
    end









  end
