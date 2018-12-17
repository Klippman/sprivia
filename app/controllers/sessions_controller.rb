class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name} is logged in!"
      redirect_to @user, notice: "#{@user.name} is logged in!"
    else
      flash[:notice] = "Login Failed"
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out!"
  end
end
