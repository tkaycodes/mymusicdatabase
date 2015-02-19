class Rdioapi

  def self.client
    @client ||= RdioApi.new(consumer_key: "49hav4bae3jttacpk3vmtu42",
      consumer_secret: "yx5VGpBx4B") 
  end

end
