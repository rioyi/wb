class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from ActionController::ParameterMissing, with: :render_nothing_bad_req
  rescue_from ActiveRecord::RecordNotFound, with: :render_nothing_bad_req
  protect_from_forgery with: :null_session
  before_action :current_user, :authenticate_request

  private

  def set_locale
    I18n.locale = user_have_lang || I18n.default_locale
  end

  # verifica que el usuario este presente y que posea un lenguaje definido
  def user_have_lang
    current_user.locale unless current_user.blank? || current_user.locale.blank?
  end

  def current_user
    @current_user ||= authentication_manager.current_user
  end

  def authentication_manager
    @authentication_manager ||= AuthenticationManager.new(request.headers)
  end

  # Serializer methods
  def default_serializer_options
    { root: false }
  end

  def current_user
    @current_user ||= authentication_manager.current_user
  end

  def authentication_manager
    @authentication_manager ||= AuthenticationManager.new(request.headers)
  end

  def authenticate_request
    data = authentication_manager.authenticate_request
    format_authentication_data(data)
  end

  # This is a before action method. Returns false to stop from executing the other
  # before action methods when it fails
  def format_authentication_data(data)
    return unless data.present? 
    response.headers.merge!(data[:headers]) if data[:headers].present?
    return unless data[:body].present?
    render json: data[:body], status: status_for_response(data[:code])
    false
  end

  def status_for_response(code)
    case code
    when AuthenticationManager::NOT_AUTH_CODE
      401
    when AuthenticationManager::TOKEN_EXPIRED_CODE
      401
    when AuthenticationManager::SUCCESS_CODE
      200
    end
  end

  def render_nothing_bad_req
    head :bad_request
  end
end
