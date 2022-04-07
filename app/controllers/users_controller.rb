class UsersController < ApplicationController
  def new

  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/search'
    else
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
