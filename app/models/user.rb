class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :songs

  serialize :twitter_omniauth_data

  def email_required?
    false
  end

  def password_required?
    provider.nil?
  end


  def self.find_or_create_from_twitter(twitter_omniauth_data)
    user = User.where(provider: :twitter, uid: twitter_omniauth_data["uid"]).first
    unless user
      # twitter_handle = twitter_omniauth_data['info']['nickname'],
      user = User.create(provider: :twitter, uid: twitter_omniauth_data["uid"],
      name: "@#{twitter_omniauth_data['info']['nickname']}",
      twitter_credentials_token:  twitter_omniauth_data["credentials"]["token"],
      twitter_credentials_secret: twitter_omniauth_data["credentials"]["secret"],
      omniauth_raw_data: twitter_omniauth_data)
    end
    user
  end

        

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
