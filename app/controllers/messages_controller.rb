class MessagesController < ApplicationController
  def regist
    @user = User.find_by(name: params[:name])
    @message = Message.new(message: params[:message], user_id:@user.id)
    if @message.save
      render json: 'OK'
    else
      render json: 'NG'
    end
  end
end
