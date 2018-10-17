require("pry")
require_relative("../models/album")
require_relative("../models/artist")
require_relative("sql_runner")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Nirvana'})
artist2 = Artist.new({'name' => 'Flipper'})



artist1.save()
artist2.save()



album1 = Album.new({
  'artist' => 'Nirvana',
  'title' => 'Nevermind',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album2 = Album.new({
    'artist' => 'Nirvana',
    'title' => 'In Utero',
    'genre' => 'Rock',
    'artist_id' => artist1.id
    })
  album3 = Album.new({
        'artist' => 'Nirvana',
        'title' => 'Bleach',
        'genre' => 'Rock',
        'artist_id' => artist2.id
        })


album1.save()
album2.save()
album3.save()




binding.pry
nil
