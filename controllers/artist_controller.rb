require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')



get '/artist' do
  @artist = Artist.all()
  erb(:"artist/index")
end

get '/artist/new' do
  erb :"artist/create_artist"
end

post '/artist' do
  artist = Artist.new(params)
  artist.save()
  redirect to ('/artist')
end

post '/artist/:id/delete' do
  Artist.delete(params["id"])
  redirect to ('/artist')
end

get '/artist/:id/update' do
  @artist = Artist.find(params["id"])
  erb :"artist/update_artist"
end

post '/artist/:id' do
  @artist = Artist.new(params)
  @artist.update
  redirect to ('/album')
end
