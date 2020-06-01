class ShopsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit,:destroy]
  
  def index
    @shops = current_user.shops.order(id: :desc).page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
  end
  
  def new
    @shop = Shop.new
    3.times { @shop.menus.build }
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      flash[:success] = 'お店情報を投稿しました。'
      redirect_to shops_path
    else
      @shops = current_user.shops.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'お店情報の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = current_user.shops.find(params[:id])
    if @shop.update(shop_params)
      flash[:success] = 'お店情報は正常に更新されました。'
      redirect_to shop_path
    else
      @shops = current_user.shops.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'お店情報は更新されませんでした。'
      render :edit
    end
  end

  def destroy
    @shop.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to shops_path
  end

  private
  
  # Strong Parameter
  def shop_params
    params.require(:shop).permit(:name, :address, :review, :area, :genre, :img, menus_attributes: [
      :menu, 
      :price, 
      :img,
      ],
    )
  end
  
  def correct_user
    @shop = current_user.shops.find_by(id: params[:id])
    unless @shop
      redirect_to root_url
    end
  end
  
end

