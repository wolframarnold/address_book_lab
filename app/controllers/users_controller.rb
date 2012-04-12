class UsersController < ApplicationController
  before_filter :load_user, only: [:show,:edit,:update,:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.create(params[:user])
    if @user.persisted?
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
