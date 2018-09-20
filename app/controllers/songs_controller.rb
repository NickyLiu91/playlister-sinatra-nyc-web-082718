class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all 
    erb :index
  end

  get '/songs/:id' do
    erb :show
  end
end
