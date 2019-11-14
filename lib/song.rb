class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist_name)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
  end

end


s = Song.new
s.name = "The Ship Song"
s.artist_name = "Nick Cave"
s.save
