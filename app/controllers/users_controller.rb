class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :edit]
  def index
    @users = User.order(:username).limit(50)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :location, :age, :bio, :avatar)
  end
end
