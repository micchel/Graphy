class PhotographerChatRoomsController < ApplicationController
  before_action :authenticate_photographer!
  before_action :all_no_photographer_read_messages

  def index
    @chatrooms = current_photographer.chatrooms.includes(:user).eager_load(:chat_messages).order("chat_messages.id DESC")
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.photographer_id == current_photographer.id 
      gon.chatroom_id = @chatroom.id
      @chat_messages = @chatroom.chat_messages.order(:created_at).includes([:user, :photographer])
      if @chat_messages.where.not(user_id: 0).present?
        last_user_message = @chat_messages.where(user_id: @chatroom.user_id).last.id
        @chatroom.update_attributes(
          readed_user_message: last_user_message
        )
      end
    else
      redirect_back(fallback_location: photographer_chat_rooms_path)
    end
  end

  private

  def all_no_photographer_read_messages
    chatrooms = Chatroom.where(photographer_id: current_photographer.id)
    messages_count = 0
    chatrooms.each do |chatroom|
      i = chatroom.no_photographer_read_messages
      messages_count += i
    end

    if messages_count > 0
      @all_no_read_messages = messages_count
    else
      @all_no_read_messages = 0
    end
  end
end
