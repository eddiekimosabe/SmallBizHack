class WelcomeController < ApplicationController
  before_action :current_user

  def index
    @businesses = Business.all
  end

end
