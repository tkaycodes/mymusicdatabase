class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    twitter_omniauth_data = request.env["omniauth.auth"].to_hash
    # render json:twitter_omnitauth_data
    user=User.find_or_create_from_twitter(twitter_omniauth_data)
      if user
        sign_in user
        redirect_to root_path, notice: "welcome"
      else
        redirect_to root_path, alert: "Could not sign you in with your twitter account; you can always Sign in/or Signup through our site"
      end
  end

  def facebook
    facebook_omniauth_data = request.env["omniauth.auth"].to_hash
      # render json: facebook_omniauth_data
    user=User.find_or_create_from_facebook(facebook_omniauth_data)
    if user
      sign_in user
      redirect_to root_path, notice: "welcome"
    else
      redirect_to root_path, alert: "Could not sign you in with facebook, you can always sign in or sign up through our website directly"
    end
  end

end