class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.length
  end

  def artist_count
    # return the number of artists associated with the genre
    all_artists = self.songs.map { |song| song.artist }
    all_artists.uniq.length
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    self.songs.map { |song| song.artist.name }
  end
end
