class PortfoliosController < ApplicationController
  before_action :authenticate_photographer!
  before_action :all_no_photographer_read_messages, only: [:new,:edit]

  def new
    @portfolio = Portfolio.new
    @categories = Category.all
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      render :js => "window.location = '/portfolios/new'", notice: 'ポートフォリオを登録しました'
    else
      render :new, alert: "ポートフォリオの登録に失敗しました"
    end
  end
  
  def edit
    @portfolio = Portfolio.find(params[:id])
    @category = @portfolio.category
    gon.portfolio_id = @portfolio.id
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      render :js => "window.location = '/portfolios/new'", notice: "#{@portfolio.category.name}のポートフォリオを変更しました"
    else
      render :edit, alert: "ポートフォリオの変更に失敗しました"
    end
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    portfolio.destroy if portfolio.photographer_id == current_photographer.id
    redirect_to new_portfolio_path
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:category_id, :image).merge(photographer_id: current_photographer.id)
  end

  def all_no_photographer_read_messages
    chatrooms = Chatroom.where(photographer_id: current_photographer.id)
    messages_count = 0
    chatrooms.each do |chatroom|
      i = chatroom.no_photographer_read_messages
      messages_count += i
    end

    if messages_count > 0
      @all_no_read_messages = messages_count
    else
      @all_no_read_messages = 0
    end
  end

end
