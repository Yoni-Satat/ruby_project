require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get '/' do
  erb :home
end

get '/stock' do
  @albums = Album.all()
  erb :stock
end
