class PortfoliosController < ApplicationController
  before_action :authenticate_photographer!

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

end
