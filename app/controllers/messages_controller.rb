class MessagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  require "time"
  
  def regist
    @user = User.find_by!(name: params[:name])
    @message = @user.messages.new(message: params[:message]) 
    if @message.save
      render status: 201, json: { data: @message}
    else
      render status: 400, json: { data: @message.errors.full_messages}
    end
  end

  def list
    @messages =Message.joins(:user).where(users: {name: params[:name]})
    change_read_status
    render json: @messages, only:[:created_at, :message] 
  end
  
  def unread_list
    @messages =Message.joins(:user).where(users: {name: params[:name]},read_status: false)
    message_list=@messages.as_json( only:[:created_at, :message] )
    change_read_status
    render json: message_list 
  end

  def search
    @messages =Message.joins(:user).where(users: {name: params[:name]}).where(created_at: params[:start_date_time]..params[:end_date_time])
    change_read_status
    render json: @messages, only:[:created_at, :message] 
  end


  def at
    @user = User.find_by!(name: params[:name])
    date_time = Time.parse(params[:date_time])
    message = @user.get_message_by_date_time(date_time)
    message = message.as_json(only:[:created_at, :message] )
    render status: 200, json: { success: true, count: 1, message: message}
  end

  private

  def change_read_status
    @messages.update_all(read_status: true)
  end

  def record_not_found
    if @user == nil
      message = params[:name] + " is not found in db"
      render status: 400, json: { success: false, message: message }
    else
      message = params[:name] + " at " + params[:date_time] + " is not found in db"
      render status: 404, json: { success: false, message: message }
    end
  end

end
