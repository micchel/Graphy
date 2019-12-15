class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def match
    all_portfolios = Portfolio.all.includes(:photographer)
    @portfolios = all_portfolios.order("RAND()").select {
      |portfolio| portfolio.not_matched?(current_user)
    }
    gon.portfolios = @portfolios
  end
end
