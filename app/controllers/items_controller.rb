class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :identification, only: [:edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if @item.buyer.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def identification
    if current_user.id == @item.user_id
    else
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :product, :explanation, :condition_id, :category_id, :delivery_charge_id,
                                 :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
