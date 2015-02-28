class SongsController < ApplicationController

    before_action :authenticate_user!, only: [:create, :index]

    def index #will show all the added songs
      if user_signed_in? == true
        @songs=current_user.songs.order(rating: :desc)          
        @songs = @songs.search(params[:searchmydb])  if params[:searchmydb].present?
        render params[:listing] ? "listing" : "index"
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
          #current_user.has_song_with_uid?(params[:uid])
          redirect_to search_path, notice: "Song already exists"
      else
        @song=Song.new(name:     params[:name],
          artist:   params[:artist],
          artwork:  params[:artwork],
          songalbum: params[:songalbum],
          artistid: params[:artistid],
          albumid: params[:albumid],
          songid: params[:songid]
          )

          @song.user=current_user

          if @song.save
            redirect_to add_to_my_songs_path, notice: "song added"
          else 
            redirect_to search_path, notice: "something went wrong"
          end
      end
    end

  def update
    @song=Song.find(params[:id])
    @song.rating = params[:song][:rating].to_i

    if @song.save
      redirect_to songs_path, notice: "rating saved!"
    else
      redirect_to songs_path, notice: "song could not be saved!"
    end
  end

  def destroy
    @song=Song.find(params[:id])
    if @song.delete
      redirect_to songs_path, notice: "Song removed!"
    else
      redirect_to songs_path, notice: "song could not be removed!"
    end
  end
end



