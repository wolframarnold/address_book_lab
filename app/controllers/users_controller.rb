class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.persisted?
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    #params[:id]
    @user = User.find(params[:id])
  end
end
