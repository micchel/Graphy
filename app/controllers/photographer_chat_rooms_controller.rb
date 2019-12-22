class PhotographerChatRoomsController < ApplicationController
  before_action :authenticate_photographer!

  def index
    @chatrooms = current_photographer.chatrooms.includes(:user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    gon.chatroom_id = @chatroom.id
    @user = @chatroom.user
    @chat_messages = ChatMessage.where(chatroom_id: @chatroom.id).order(:created_at)
  end
end
