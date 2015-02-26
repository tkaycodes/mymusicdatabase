class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :songs

  ratyrate_rater

  def rating_for_song(song)
    rating_for_song = ratings_given.where(rateable_type: 'Song', rateable_id: song.id).first

    if rating_for_song.present?
      rating_for_song.stars
    else
      0.0
    end
  end
end
