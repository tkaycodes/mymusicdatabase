module Rdio
  
  def self.client
    @client ||= RdioApi.new(consumer_key: "49hav4bae3jttacpk3vmtu42",
                            consumer_secret: "yx5VGpBx4B") 
  end

  def self.search(text)
    response = Rdio.client.search(query: text, types: 'song')
    response.results.map { |songfield| Song.new(songfield) }
  end

  class Song
    attr_reader :name, :artist, :artwork

    def initialize(result)
      # @uid =    result.key
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
