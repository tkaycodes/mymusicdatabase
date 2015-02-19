class Rdio
  def self.client
    @client ||= RdioApi.new(consumer_key: "49hav4bae3jttacpk3vmtu42",
                            consumer_secret: "yx5VGpBx4B") 
  end

  def self.search(text)
    response = @client.search(query: text, types: 'song')
    response.results.map { |result| Song.new(result) }
  end

  class Song
    def initialize(result)
      @name =   result.name
      @artist = result.artist
      @artwork = result.icon400
    end

    attr_reader :name, :artist, :artwork
  end




 end





