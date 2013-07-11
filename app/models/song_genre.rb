class SongGenre < ActiveRecord::Base
  attr_accessible :genre_id, :song_id, :genre, :song
  belongs_to :song
  belongs_to :genre
end
