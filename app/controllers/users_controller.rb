class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  def index
    @users = User.order(:username).limit(50)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find_by(slug: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :location, :age, :bio, :avatar)
  end
end
