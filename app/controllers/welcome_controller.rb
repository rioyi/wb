class WelcomeController < ApplicationController
  before_action :authenticate_request, except: %i[index authenticable]
  def index; end

  def authenticable
    auth = request.env['omniauth.auth']
    user = User.find_by(email: auth.info.email)
    User.create(user_params(auth)) if user.nil?
    token_data = AuthenticableEntity.generate_access_token(user)
    render json: { access_token: token_data[:token], email: auth.extra.raw_info.email }, status: :ok
  end

  def user_params(auth)
  {
    email: auth.extra.raw_info.email,
    password: auth.uid,
    password_confirmation: auth.uid,
    first_name: auth.info.first_name,
    last_name: auth.info.last_name,
    provider: auth.provider,
    uid: auth.uid
  }
  end
end
