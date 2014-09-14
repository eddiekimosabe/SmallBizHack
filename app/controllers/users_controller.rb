class UsersController < ApplicationController
  # signup GET    /signup(.:format)         users#new
  #        POST   /signup(.:format)         users#create

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  protected
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
