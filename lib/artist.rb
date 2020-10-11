require 'pry'

class Artist

    attr_accessor :name, :songs 

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end

    def self.all 
        @@all 
    end

    def add_song(song)
        song.artist = self 
    end

    def songs 
        #return array of all songs that belong to this Artist instance
        #.select 
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name) 
        #find the Artist instance that has this name
        instance = self.all.find { |artist| artist.name == artist_name }
        # if instance 
        #     instance
        # elsif instance == nil 
        #     self.new(artist_name)
        # end
        instance ? instance : self.new(artist_name) #ternary for simple if/elsif statement above
        #create one if it doesn't
    end

    def print_songs
        songs.each {|song| puts song.name} 
    end
  
end #end of Artist class

#binding.pry 