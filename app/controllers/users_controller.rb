class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
        if @user.save
        flash[:notice] = 'Successfully Created!'
        redirect_to '/sign-in'
        else
        flash[:notice] = 'Email Already Exists!'
        render :new 
      end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "Info Updated!"
    redirect_to current_user
  end 

  def sprivia
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:notice] = 'User deleted!'
    redirect_to '/'
  end

  private

  def user_params 
    params.require(:user).permit(:name, :email, :nickname, :password)
  end
end
