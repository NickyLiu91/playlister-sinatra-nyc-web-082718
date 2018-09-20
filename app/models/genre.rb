require_relative 'concerns/slugifiable'

class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :song, through: :song_genres

  include Slug
end
