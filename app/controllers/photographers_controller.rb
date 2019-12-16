class PhotographersController < ApplicationController
  before_action :authenticate_user!

  def index
    @photographers = Reaction.where(user_id: current_user.id, status: 1).map {
      |reaction| reaction.photographer
    }
  end

  def show
    @photographer = Photographer.find(params[:id])
    @portfolios = @photographer.portfolios
  end
end
