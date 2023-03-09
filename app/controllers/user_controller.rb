

class UserController < ApplicationController
  def regist
    @user = User.new(name: params[:name])
    @user.save
  end
end
