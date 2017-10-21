require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require('pry')


artist1 = Artist.new({
  'name' => 'Pink Floyd'
  })
  artist1.save()

artist2 = Artist.new({
  'name' => 'Pet Shop Boys'
  })
  artist2.save()

album1 = Album.new({
  'title' => 'Dark Side of The Moon',
  'quantity' => 10,
  'artist_id' => artist1.id
  })

  album1.save()

  album2 = Album.new({
    'title' => 'Actually',
    'quantity' => 10,
    'artist_id' => artist2.id
    })

    album2.save()

    binding.pry
    nil
