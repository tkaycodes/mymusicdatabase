class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :songs

  serialize :twitter_omniauth_data

  serialize :facebook_omniauth_data

  def omniauth_data
    if omniauth_raw_data?
     # Assumes that omniauth_raw_data is safe to eval!
     JSON.parse(omniauth_raw_data)
    else
      {}
    end 
  end

  def authenticated_by_facebook?
    omniauth_data['provider'] == 'facebook'
  end

  def authenticated_by_twitter?
    omniauth_data['provider'] == 'twitter'
  end

  def profile_image_url
    data = omniauth_data
    if authenticated_by_facebook?
      data['info']['image']
    elsif authenticated_by_twitter?
      data['profile_image_url']
    else
      nil
    end
  end

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
        # image: twitter_omniauth_data["info"]["image"],
      twitter_credentials_token:  twitter_omniauth_data["credentials"]["token"],
      twitter_credentials_secret: twitter_omniauth_data["credentials"]["secret"],
      omniauth_raw_data: twitter_omniauth_data["extra"]["raw_info"].merge(provider: "twitter").to_json)
    end
    user
  end

  def self.find_or_create_from_facebook(facebook_omniauth_data)
    user=User.where(provider: :facebook, uid:facebook_omniauth_data["uid"]).first
    unless user
      user=User.create(provider: :facebook, 
                      uid: facebook_omniauth_data["uid"],
                      email: facebook_omniauth_data["info"]["email"],
                      name: facebook_omniauth_data["info"]["name"],
                      facebook_credentials_token: facebook_omniauth_data["credentials"]["token"],
                      facebook_credentials_expires_at: facebook_omniauth_data["credentials"]["expires_at"],
                      omniauth_raw_data: facebook_omniauth_data.to_json)
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
