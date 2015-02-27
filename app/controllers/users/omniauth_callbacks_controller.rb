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

end