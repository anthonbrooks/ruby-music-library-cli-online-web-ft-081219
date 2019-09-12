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
    Song.all.detect { |song| song.name == name } unless Song.all.include?(self.name)
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name)
  end 
end 