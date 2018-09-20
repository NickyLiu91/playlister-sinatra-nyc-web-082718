class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:name' do
    @genre = Genre.find do |genre|
      genre.slug == params['name']
    end
    @songs = @genre.songs
    @artists = @genre.artists
    erb :'genres/show'
  end
end
