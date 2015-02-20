class SongsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def index #will show all the added songs
   if user_signed_in? == true
    @songs=current_user.songs
    else
    redirect_to root_path
    end
  end

  def create # will add new songs to my database

    @songs=Song.all
  if @songs.exists?(name: params[:name],
                   artist: params[:artist],
                   artwork: params[:artwork],
                   user_id: current_user.id)

      # current_user.has_song_with_uid?(params[:uid])
  redirect_to search_path, notice: "Song already exists"
                    else
                     @song=Song.new(name:     params[:name],
                                    artist:   params[:artist],
                                    artwork:  params[:artwork])
                    @song.user=current_user
                    if @song.save
                    redirect_to add_to_my_songs_path, notice: "song added"
                    else 
                    redirect_to search_path, notice: "something went wrong"
                    end

  end
end

    
 


end



