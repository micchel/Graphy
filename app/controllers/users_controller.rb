class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :all_no_user_read_messages

  def match
    @portfolios = []
    gon.portfolios = @portfolios
  end

  def search
    if searched_portfolios = Portfolio.where(category_id: category_params[:category]).includes(:photographer)
      @portfolios = searched_portfolios.order("RAND()").select {
        |portfolio| portfolio.not_matched?(current_user)
      }
      gon.portfolios = @portfolios
      render :match
    else
      render :match, alert: "ご指定のカテゴリーには作品がまだありません"
    end
  end

  private

  def category_params
    params.permit(:category)
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
