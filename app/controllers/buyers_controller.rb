class BuyersController < ApplicationController
  def index
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
    params.require(:buyer_address).permit(:post_code, :street_name, :house_number, :prefecture_id, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
