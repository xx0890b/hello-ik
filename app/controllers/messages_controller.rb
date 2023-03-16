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

  def show
    @messages =Message.joins(:user).where(users: {name: params[:name]})
    render json: @messages, only:[:created_at, :message] 
  end
  
  def search
    @messages =Message.joins(:user).where(users: {name: params[:name]}).where(created_at: params[:start_date_time]..params[:end_date_time])
    render json: @messages, only:[:created_at, :message] 

  end
end
