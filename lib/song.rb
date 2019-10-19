require 'pry'

class Song

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  attr_accessor :name
  attr_reader :artist

  @@songs = []

  def self.all
    @@songs
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
end

adele = Artist.new
adele.name = "Adele"
who_cares = Song.new
who_cares.name = "Who Cares"
adele.add_song(who_cares)
Artist.find_by_name("Adele").name