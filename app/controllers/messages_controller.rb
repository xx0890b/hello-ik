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
  
  def search
    @messages =Message.joins(:user).where(users: {name: params[:name]}).where(created_at: params[:start_date_time]..params[:end_date_time])
    render json: @messages, only:[:created_at, :message] 

  end


  def at
    user = User.find_by(name: params[:name])
    date_time = params[:date_time].sub(/T/," ")
    status, message = user.get_message_by_date_time(date_time)
    if status
     message = message.as_json(only:[:created_at, :message] )

     render status: 200, json: { success: status, count: 1, message: message}
    else
     message = user.name + " at " + params[:date_time] + " is not found in db"
     render status: 404,json: { success: status, message: message }
    end

  end

end
