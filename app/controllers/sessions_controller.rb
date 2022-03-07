class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # Checking if user is found
    if user && user.authenticate(params[:session][:password])
      # Rails provided session object
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      # .now has validity for one http request
      flash.now[:alert] = "There was something wrong with your login details!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!"
    redirect_to root_path
  end
end