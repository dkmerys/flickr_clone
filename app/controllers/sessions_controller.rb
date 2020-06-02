class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You've successfully signed in!"
      session[:user_id] = @user_id
      redirect_to '/'
    else
      flash[:alert] = "there was a problem signing in"
      redirect_to '/users/sign_in(.:format)devise/sessions#new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are signed out"
    redirect_to '/'
  end
end