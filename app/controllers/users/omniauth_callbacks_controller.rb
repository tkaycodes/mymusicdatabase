class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

def twitter
  omnitauth_data = request.env["omniauth.auth"]
  render json:omnitauth_data
end

end