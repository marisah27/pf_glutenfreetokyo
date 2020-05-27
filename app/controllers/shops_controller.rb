class ShopsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @shops = current_user.shops.order(id: :desc).page(params[:page])
  end

  def show
  end

  def new
    @shop = current_user.shops.build
  end

  def create
    @shops = current_user.shops.build(shop_params)
    byebug
    if @shops.save
      flash[:success] = 'お店情報を投稿しました。'
      redirect_to root_url
    else
      @shops = current_user.shops.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'お店情報の投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  # Strong Parameter
  def shop_params
    params.require(:shop).permit(:name, :address, :review, :area, :genre, :img)
  end
  
end

