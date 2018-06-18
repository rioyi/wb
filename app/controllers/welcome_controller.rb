class WelcomeController < ApplicationController
  before_action :authenticate_request, except: :index
  def index; end
end
