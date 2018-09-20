class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:name' do
    @song = Song.find do |song|
      song.slug == params['name']
    end
    erb :'songs/show'
  end
end
