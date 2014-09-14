class WelcomeController < ApplicationController
  before_action :current_user


  def index
    @business = @user.business if current_user
  end
end