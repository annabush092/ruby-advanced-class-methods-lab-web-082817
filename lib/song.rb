require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

#returns the array holding all the instances of the Song class
  def self.all
    @@all
  end

  def initialize(n = "unknown")
    @name = n
    @artist_name = ""
  end

#adds this instance of the class into the @@all array. Returns the @@all array.
  def save
    self.class.all << self
    #simplify: Song.all << self
    #simplify more: array of all the song objects << this instance
  end

#creates a new instance of Song and saves it into the @@all array
#returns the newly created instance
  def self.create
    new.save.last
  end

  def self.new_by_name(n)
    new(n)
  end

  def self.create_by_name(n)
    new_by_name(n).save.last
  end

  def self.find_by_name(n)
    all.find do |song_obj|
      song_obj.name == n
    end
  end

  def self.find_or_create_by_name(n)
    if find_by_name(n) != nil
      find_by_name(n)
    else
      create_by_name(n)
    end
  end

  def self.alphabetical
    all.sort do |song_obj_1, song_obj_2|
      song_obj_1.name <=> song_obj_2.name
    end
  end

  def self.new_from_filename(filename)
    new_obj = new
    new_obj.artist_name, new_obj.name = filename.slice(0...-4).split(" - ")
    new_obj
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save.last
  end

  def self.destroy_all
    all.clear
  end

end
