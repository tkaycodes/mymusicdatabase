class TrendingController < ApplicationController

  def index

    @songs = Song.all
  
  end


 


end
