class Genre < ActiveRecord::Base
  attr_accessible :name

  has_many :song_genres
  has_many :songs, :through => :song_genres
end
