class Song < ActiveRecord::Base
  belongs_to :user

end

# Song
# vs.
# Rdio::Song