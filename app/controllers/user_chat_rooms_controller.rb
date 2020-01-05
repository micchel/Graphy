class UserChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :all_no_user_read_messages, only: [:index, :show]

  def index
    @chatrooms = current_user.chatrooms.includes(:photographer).eager_load(:chat_messages).order("chat_messages.id DESC")
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.user_id == current_user.id
      gon.chatroom_id = @chatroom.id
      @chat_messages = @chatroom.chat_messages.order(:created_at).includes([:user, :photographer])
      if @chat_messages.where.not(photographer_id: 0).present?
        last_photographer_message = @chat_messages.where(photographer_id: @chatroom.photographer_id).last.id
        @chatroom.update_attributes(
          readed_photographer_message: last_photographer_message
        )
      end
    else
      redirect_back(fallback_location: user_chat_rooms_path)
    end
  end

  def create
    chatroom = Chatroom.where(user_id: current_user.id, photographer_id: chatroom_params[:photographer_id]).first
    if chatroom.blank?
      chatroom = Chatroom.create(chatroom_params)
      redirect_to action: :show, id: chatroom.id
    end
  end

  private

  def chatroom_params
    params.permit(:photographer_id).merge(user_id: current_user.id)
  end

  def all_no_user_read_messages
    chatrooms = Chatroom.where(user_id: current_user.id)
    messages_count = 0
    chatrooms.each do |chatroom|
      i = chatroom.no_user_read_messages
      messages_count += i
    end
    if messages_count > 0
      @all_no_read_messages = messages_count
    else
      @all_no_read_messages = 0
    end
  end
  
end
