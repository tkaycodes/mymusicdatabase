class Song < ActiveRecord::Base
  # searchkick
  belongs_to :user
end

# Song
# vs.
# Rdio::Song