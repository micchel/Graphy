class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_for "chatroom_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = ChatMessage.create!(chatroom_id: data['room_id'], user_id: data['user_id'], photographer_id: data['photographer_id'], message: data['message'])
    ChatroomChannel.broadcast_to "chatroom_#{data['room_id']}", content: render_message(message)
  end
  
  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'shared/chat_message', locals: { chat_message: message })
  end

end
