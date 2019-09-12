class Song 
  
  attr_accessor :name 
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
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
  
  def find_by_name(name)
    self.all.detect { |song| song.name == name }
  end 
  
  def find_or_create_by_name(name)
    
  end 
end 