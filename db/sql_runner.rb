require('pg')

class SqlRunner

  def self.run(sql, values = [])
    # tells ruby if theres nothing in the values just make an empty array
    begin
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      db.prepare("query", sql)
      # query is just a name
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end







end
