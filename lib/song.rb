class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = [] 
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song 
  end 
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.songs.push(self) unless @genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end 
  
  def self.new_from_filename(file)
    parts = file.split(' - ')
    artist_name, song_name, genre = parts[0], parts[1], parts[2].gsub(".mp3", "")
    artist = find_or_create_by_name(artist_name)
    genre = find_or_create_by_name
  end 
  
end 