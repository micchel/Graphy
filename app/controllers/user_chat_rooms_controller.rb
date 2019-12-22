class UserChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = current_user.chatrooms.includes(:photographer)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    gon.chatroom_id = @chatroom.id
    @photographer = @chatroom.photographer
    @chat_messages = ChatMessage.where(chatroom_id: @chatroom.id).order(:created_at).includes([:user, :photographer])
  end

  def create
    chatroom = Chatroom.where(user_id: current_user.id, photographer_id: chatroom_params[:photographer_id]).first
    if chatroom.blank?
      chatroom = Chatroom.create(chatroom_params)
    end
    redirect_to action: :show, id: chatroom.id
  end

  private

  def chatroom_params
    params.permit(:photographer_id).merge(user_id: current_user.id)
  end
end
