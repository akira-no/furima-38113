class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
       redirect_to root_path
    end
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :city, :house_number, :prefecture_id, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
