class UserController < ApplicationController
  def regist
    @user = User.new(name: params[:name])
    if @user.save
      render status: 201, json: { data: @user}
    else
      render status: 400, json: { data: @user.errors.full_messages }
    end
  end
end
