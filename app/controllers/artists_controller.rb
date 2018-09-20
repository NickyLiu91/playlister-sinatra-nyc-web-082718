class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:name' do
    @artist = Artist.find do |artist|
      artist.slug == params['name']
    end
    @songs = @artist.songs
    @genres = @artist.genres
    erb :'artists/show'
  end
end
