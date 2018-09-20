class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:id' do
    @artist = Artist.find do |artist|
      artist.slug == params['name']
    end
    erb :'artists/show'
  end
end
