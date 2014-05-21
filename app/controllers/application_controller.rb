class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :current_user

# stub for now
  def current_user
    @current_user ||= User.first
  end
end
