class PhotographerChatRoomsController < ApplicationController
  before_action :authenticate_photographer!

  def index
    @chatrooms = current_photographer.chatrooms.includes(:user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    gon.chatroom_id = @chatroom.id
    @user = @chatroom.user
    @chat_messages = @chatroom.chat_messages.order(:created_at).includes([:user, :photographer])
    if @chat_messages.where.not(user_id: 0).present?
      last_user_message = @chat_messages.where(user_id: @chatroom.user_id).last.id
      @chatroom.update_attributes(
        readed_user_message: last_user_message
      )
    end
  end
end
