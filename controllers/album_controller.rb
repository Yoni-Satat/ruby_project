require_relative('../models/album.rb')
require_relative('../models/artist.rb')



get '/album' do
  @albums = Album.all()
  erb :"album/stock"
end

get '/album/new' do
  @artists = Artist.all()
  erb :"album/create_album"
end

post '/album' do
  album = Album.new(params)
  album.save()
  redirect to ('/')
end

post '/album/:id/delete' do
  Album.delete(params["id"])
  redirect to ('/album')
end
