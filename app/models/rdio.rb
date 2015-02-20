module Rdio
  
  def self.client
    @client ||= RdioApi.new(consumer_key: "49hav4bae3jttacpk3vmtu42",
                            consumer_secret: "yx5VGpBx4B") 
  end

  def self.search(text)
    response = Rdio.client.search(query: text, types: 'song')
    response.results.map { |result| Song.new(result) }
  end

  class Song
    attr_reader :name, :artist, :artwork, :uid

    def initialize(result)
      @uid = result.key
      @name =   result.name
      @artist = result.artist
      @artwork = result.icon400
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
