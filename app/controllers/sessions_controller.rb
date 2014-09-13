class SessionsController < ApplicationController
  #  login GET    /login(.:format)          sessions#new
  #        POST   /login(.:format)          sessions#create
  # logout DELETE /logout(.:format)         sessions#destroy

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in successfully"
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out successfully"
  end
end