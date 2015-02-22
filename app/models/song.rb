class Song < ActiveRecord::Base
  # searchkick
  belongs_to :user

   # Song.order(rating: :desc);

  def self.search(name)
  if name
    self.where("name iLIKE ?", "%#{name}%")
    else
     self.all
     render "sdslfja";
    # redirect_to 
  end
end


end

# Song
# vs.
# Rdio::Song