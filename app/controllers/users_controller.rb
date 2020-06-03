class UsersController < ApplicationController

  def index
    puts "Something"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_cover_photo.attach(params[:user][:user_cover_photo])
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user_id
      redirect_to '/signup'
    else
      flash[:alert] = "There was a problem signing up"
      redirect_to '/signup'
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :user_cover_photo)
  end
end