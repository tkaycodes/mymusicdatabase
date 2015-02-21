class Song < ActiveRecord::Base
  # searchkick
  belongs_to :user

   # Song.order(rating: :desc);
end

# Song
# vs.
# Rdio::Song