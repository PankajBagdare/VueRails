class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    debugger
    if user.present?
      if (params[:password] == user.password)
        token = SecureRandom.hex
        user.token = token
        user.save
        render json: { success: true, user: user, token: token }, status: 200
      else
        render json: { success: false, message: 'Wrong password entered'}, status: 404
      end
    else
      render json: { success: false, message: 'Wrong email address'}, status: 404
    end

  end
end
