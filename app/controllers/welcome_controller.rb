class WelcomeController < ApplicationController
  include ChartsHelper
  before_action :current_user

  def index
    @business = @user.business if current_user
    set_up_vars_for_charts_api
  end
end
