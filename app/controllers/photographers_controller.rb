class PhotographersController < ApplicationController
  before_action :authenticate_user!

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
end
