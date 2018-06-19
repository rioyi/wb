class SessionsController < ApplicationController
  before_action :user_exist?

  def user_exist?
    @auth = request.env['omniauth.auth']
    @user = User.find_by(email: @auth.info.email)
  end

  def authenticable
    @user = User.create(user_params) if @user.nil?
    token_data = AuthenticableEntity.generate_access_token(@user)
    render json: { access_token: token_data[:token], renew_id: token_data[:renew_id] }, status: :ok
  end

  def user_params
    { email: @auth.extra.raw_info.email,
      password: @auth.uid,
      password_confirmation: @auth.uid,
      first_name: @auth.info.first_name,
      last_name: @auth.info.last_name,
      provider: @auth.provider,
      uid: @auth.uid }
  end
end
