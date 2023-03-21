class UserController < ApplicationController
  def regist
    @user = User.new(name: params[:name])
    if @user.save
      render json: { data: @user, status: :created }
    else
      render json: { data: @user.errors.full_messages, status: :bad_request }
    end
  end
end
