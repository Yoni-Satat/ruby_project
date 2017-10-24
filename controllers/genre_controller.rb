require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')

get '/genre' do
  @genres = Genre.all()
  erb :"artist/index"
end

get '/genre/new' do
  erb :"genre/create_genre"
end

post '/genre' do
  genre = Genre.new(params)
  genre.save()
  redirect to ('/')
end
