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
    
    if @messages.length !=0
      @messages.each do |message|
        if result_message == nil
          result_message='"message": ['
        else
          result_message += ','
        end  
        result_message += ' { "registered_at": "' + message.created_at.to_s + '",'
        result_message += ' "message": "' + message.message + '"}'
      end
      result_message += ']'  
    else
      result_message='0件'
    end
    render json: result_message
  end
  
end
