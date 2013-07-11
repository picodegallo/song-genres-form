class Song < ActiveRecord::Base
  attr_accessible :name

  has_many :song_genres
  has_many :genres, :through => :song_genres

  def add_genres_by_name(genre_names)
    genre_names.collect(&:strip).collect(&:downcase).reject(&:blank?).uniq
      add_genre_by_name(genre_names)
  end

  def add_genre_by_name(genre_name)
    genre = Genre.where(:name => genre_name).first_or_create
    self.song_genres.build(:genre => genre)
  end

  def add_genres_by_id(genre_ids)
    genre_ids.uniq.each do |genre_id|
      self.song_genres.build(:genre_id => genre_id)
    end
  end

  def genre_names
    self.genres.collect{|g| g.name}
  end

end
