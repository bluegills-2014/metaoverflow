class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :update,:edit,:destroy]
  def index
    @users = User.order(:username).limit(50)
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root
  end


  private

  def set_user
    @user = User.find_by(username: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :location, :age, :bio, :avatar)
  end
end
