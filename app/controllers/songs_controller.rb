require_relative '../models/concerns/slugifiable'

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    puts params
    artist = Artist.find_by(name: params['artist'])
    if artist == nil
      artist = Artist.create(name: params['artist'])
    end
    genre_names = params.select do |key, value|
      Genre.all.include?(key)
    end.keys
    genres = genre_names.map do |genre|
      Genre.find_by(name: genre)
    end
    song = Song.create(name: params['Name'], artist: artist, genres: genres)
    binding.pry
    redirect :"songs/#{song.slug}"
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:name' do
    @song = Song.find do |song|
      song.slug == params['name']
    end
    @artist = @song.artist
    @genres = @song.genres
    erb :'songs/show'
  end

  include Slug
end
