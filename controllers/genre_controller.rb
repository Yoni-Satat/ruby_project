require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')

get '/genre' do
  @genres = Genre.all()
  erb :"genre/index"
end

get '/genre/new' do
  erb :"genre/create_genre"
end

post '/genre' do
  genre = Genre.new(params)
  genre.save()
  redirect to ('/genre')
end

post '/genre/:id/delete' do
  Genre.delete(params["id"])
  redirect to ('/genre')
end

get '/genre/:id/update' do
  @genres = Genre.find(params["id"])
  erb :"genre/update_genre"
end

post '/genre/:id' do
  @genres = Genre.new(params)
  @genres.update
  redirect to ('/genre')
end
