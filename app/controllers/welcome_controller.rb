class WelcomeController < ApplicationController
  before_action :authenticate_request, except: %i[index]
  def index; end
end
