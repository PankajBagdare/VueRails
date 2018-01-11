class UsersController < ApplicationController

  def index
    render json: { success: true, users: User.all }, status: 200
  end

  def show
    @user = User.find_by(id: params[:id]) 
    render json: { sucess: true, user: @user }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { success: true, user: @user }, status: 200
    else
      render json: { success: false, message: 'User is not saved' }, status: 404
    end
  end

  def update
    @user = User.find_by(id: params[:id]) 
    if @user.update_attributes(user_params)
      render json: { success: true, user: @user }, status: 200
    else
      render json: { success: false, message: 'User is not saved' }, status: 404
    end
  end
  
  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :username,
      :address,
      :city,
      :country
    )
  end
end
