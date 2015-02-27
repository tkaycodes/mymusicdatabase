module Rdio
  
  def self.client
    @client ||= RdioApi.new(consumer_key: Rails.application.secrets.rdio_key,
                            consumer_secret: Rails.application.secrets.rdio_secret) 
  end



  def self.search(text)
    response = Rdio.client.search(query: text, types: 'song')
    response.results.map { |result| Song.new(result) }
  end


  

  class Song
    attr_reader :name, :artist, :artwork, :album, :artistid, :albumid, :songid

    def initialize(result)
      @name =   result.name
      @artist = result.artist
      @artwork = result.icon400
      ######other attrs
      @album = result.album
      ### stat attr
      @artistid = result.artistKey
      @albumid = result.albumKey
      @songid = result.to_hash['key']

    end

  end

 end

 # Rdio::Song

# def uid
#   @uid
# end

#this is a class (song) within a class (Rdio), so the object thats created from this
# is a Rdio::Song
#check in rails c . 

#anytime we say Rdio.client (client is a method that weve defined)
#same for Rdio.search ( "randomshithere")
#it will take "randomshithere" to search database
#then it will take the results it gets from there and turn them all to 
#song objects, song(resultfromapi)
#it gives song three attributes 
#Song.name which is  -  resultfromapi.name
#Song.artist which is   resultfromapi.artist
#Song.artwork which is  resultfromapi.icond400 
