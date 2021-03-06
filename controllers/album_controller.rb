require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')



get '/album' do
  @albums = Album.all()
  erb :"album/stock"
end

get '/album/new' do
  @artists = Artist.all()
  @genres = Genre.all()
  erb :"album/create_album"
end

post '/album' do
  album = Album.new(params)
  album.save()
  redirect to ('/album')
end

post '/album/:id/delete' do
  Album.delete(params["id"])
  redirect to ('/album')
end

get '/album/:id/update' do
  @artists = Artist.all()
  @albums = Album.find(params["id"])
  @genres = Genre.all()
  erb :"album/update_album"
end

post '/album/:id' do
  @albums = Album.new(params)
  @albums.update
  redirect to ('/album')
end
