class Song

    attr_accessor :name, :artist 

    @@all = [] 

    def initialize(name)
        @name = name
        
        @@all << self 
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        #find song name and artist name through filename
        data = filename.split(" - ") 
        #create a new Song instance using string we gathered from filename
        new_song = self.new(data[1])
        #associate new song with an artist
        new_song.artist_name = data[0] 
        #return new Song instance 
        new_song 
    end

    def artist_name=(artist_name)
        #turn artist_name string into Artist object
        self.artist = Artist.find_or_create_by_name(artist_name)
        #assign song to the artist 
    end
end #end of Song class