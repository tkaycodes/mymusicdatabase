class SearchController < ApplicationController




  def index
  end

  def create

  @client = Rdio.client
  @typeasong = params[:usersearch]
  @result = Rdio.search(@typeasong)
  # render plain: params
  # render plain: params[:usersearch]
  # render plain: @usersearch;
  end
  
end

# @client = Rdio.client
#     @whatdoyouwant = params[:usersearch]
#     @result = Rdio.search(@whatdoyouwant)