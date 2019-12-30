class PhotographersController < ApplicationController
  before_action :authenticate_user!
  before_action :all_no_user_read_messages

  def index
    @photographers = Reaction.where(user_id: current_user.id, status: 1).map {
      |reaction| reaction.photographer
    }
  end

  def show
    @photographer = Photographer.find(params[:id])
    @chatroom = Chatroom.find_by(user_id: current_user.id, photographer_id: @photographer.id)
    @portfolios = @photographer.portfolios
  end

  private

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
