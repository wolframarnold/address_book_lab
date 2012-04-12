class AddressesController < ApplicationController
  before_filter :load_address, only: [:edit,:update,:destroy]

  def new
    @address = Address.new(user_id: params[:user_id])
  end

  def edit
  end

  def create
    @address = Address.create(params[:address])
    if @address.persisted?
      redirect_to user_path(@address.user_id)
    else
      render :new
    end
  end

  def update
    if @address.update_attributes(params[:address])
      redirect_to user_path(@address.user_id)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to user_path(@address.user_id)
  end

  private

  def load_address
    @address = Address.find(params[:id])
  end
end
