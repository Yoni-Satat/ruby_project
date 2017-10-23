require_relative('../models/album.rb')
require_relative('../models/artist.rb')



get '/artist' do
  @artist = Artist.all()
  erb :stock
end

get '/artist/new' do
  erb :create_artist
end

post '/artist' do
  artist = Artist.new(params)
  artist.save()
  redirect to ('/')
end
