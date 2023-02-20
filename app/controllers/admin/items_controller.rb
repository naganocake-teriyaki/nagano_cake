class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      flash[:notice] = "登録に成功しました"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "入力内容を確認してください"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page])
    @items_count = Item.where(is_active:"0").count
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :price, :is_active, :image)
  end
end