class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    render "users/edit"
  end

  def new
  end

  def create
    
    @user = User.new(user_params)    

    if @user.save
      redirect_to root_path
    else
      return false
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)   
  end

  def destroy
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :birthday, :profile_photo)
  end
end
