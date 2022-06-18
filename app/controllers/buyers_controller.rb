class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_buyer, only: [:index, :create]

  def index
    redirect_to root_path if (current_user.id == @item.user_id) ||  @item.buyer.present?
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :city, :house_number, :prefecture_id, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_buyer
    @item = Item.find(params[:item_id])
  end
end
