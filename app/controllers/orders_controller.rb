class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @sendbuy = SendBuy.new
    return unless current_user.id == @item.user_id || !@item.buy.nil?

    redirect_to root_path
  end

  def create
    @sendbuy = SendBuy.new(send_params)
    if @sendbuy.valid?
      pay_item
      @sendbuy.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def send_params
    params.require(:send_buy).permit(:postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: send_params[:token],
      currency: 'jpy'
    )
  end
end
