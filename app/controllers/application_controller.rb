class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_logged_in_as_owner
    unless current_user && current_user == @business.user
      redirect_to root_path and return true
    end
  end
end