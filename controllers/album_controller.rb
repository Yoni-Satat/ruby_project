require_relative('../models/album.rb')
require_relative('../models/artist.rb')



get '/album' do
  @albums = Album.all()
  erb :stock
end

get '/album/new' do
  @artists = Artist.all()
  erb :create_album
end

post '/album' do
  album = Album.new(params)
  album.save()
  redirect to ('/')
end
