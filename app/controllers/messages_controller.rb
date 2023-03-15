class MessagesController < ApplicationController
  def regist
    @user = User.find_by(name: params[:name])
    @message = @user.messages.new(message: params[:message]) 
    if @message.save
      render json: 'Registration successful'
    else
      render json: 'Registration failed'
    end
  end

  def show
    result_message=nil
    @messages =Message.joins(:user).where(users: {name: params[:name]})

    render json: @messages, only:[:created_at, :message]
 
  end
  
end
