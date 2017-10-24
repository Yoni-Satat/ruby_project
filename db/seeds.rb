require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')
require('pry')


genre1 = Genre.new({'type' => 'Pop'})
genre1.save()

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
  'quantity' => 5,
  'artist_id' => artist1.id,
  'genre_id' => genre1.id
   })

album1.save()

album2 = Album.new({
  'title' => 'Actually',
  'quantity' => 10,
  'artist_id' => artist2.id,
  'genre_id' => genre1.id
   })

  album2.save()

album3 = Album.new({
  'title' => 'Wish You Were Here',
  'quantity' => 20,
  'artist_id' => artist1.id,
  'genre_id' => genre1.id
   })

  album3.save()



    binding.pry
    nil
