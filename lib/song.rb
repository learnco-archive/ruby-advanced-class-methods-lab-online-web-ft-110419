class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
   song = self.new
   song.name = name
   song
 end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song = self.create_by_name(name) if !song
    song
  end

  def self.alphabetical
    sorted_songs = self.all.sort_by { |s| s.name }
    sorted_songs
  end

  def self.new_from_filename(filename)
    # parse song
    parts = filename.split(" - ")
    artist = parts[0]
    name = parts[1].chomp(".mp3")

    # save song instance
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
