class Song 
  
  attr_accessor :name, :artist
  
  @@all = [] 
  
  def initialize(name, artist=nil)
    @name = name 
    @artist = artist
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
    artist.add_song(self)
  end
  
  def find_by_name(name)
    Song.all.detect { |song| song.name == name } unless Song.all.include?(song.name)
  end 
  
  def find_or_create_by_name(name)
    Song.all.detect { |song| song.name == name } unless Song.all.include?(song.name)
  end 
end 