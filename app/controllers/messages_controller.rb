class MessagesController < ApplicationController
  def regist
    @user = User.find_by(name: params[:name])
    @message = @user.messages.new(message: params[:message]) 
    if @message.save
      render json: { data: @message, status: :created }
    else
      render json: { data: @message.errors.full_messages, status: :bad_request }
    end
  end

  def list
    @messages =Message.joins(:user).where(users: {name: params[:name]})
    render json: @messages, only:[:created_at, :message] 
  end

end
