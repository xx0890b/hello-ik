class UserController < ApplicationController
  def regist
    @user = User.new(name: params[:name])
    if @user.save
      render json: 'User registration completed'
    else
      render json: 'User registration failed'
    end
  end
end
