class SongsController < ApplicationController

  def index #will show all the added songs
   if user_signed_in? == true
    @songs=current_user.songs
    else
    redirect_to root_path
    end
  end

  def create # will add new songs to my database

    @song=Song.new(name:     params[:name],
                   artist:   params[:artist],
                   artwork:  params[:artwork])
    @song.user=current_user
    if @song.save
    redirect_to root_path, notice: "song added"
    else 
    redirect_to root_path, notice: "something went wrong"
    end

  end


end



