class UsersController < ApplicationController
  before_action :authenticate_user!

  def match
    @portfolios = []
    gon.portfolios = @portfolios
  end

  def search
    searched_portfolios = Portfolio.where(category_id: category_params[:category]).includes(:photographer)
    @portfolios = searched_portfolios.order("RAND()").select {
      |portfolio| portfolio.not_matched?(current_user)
    }
    gon.portfolios = @portfolios
    render :match
  end

  private

  def category_params
    params.permit(:category)
  end
end
