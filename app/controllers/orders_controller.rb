class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @sendbuy = SendBuy.new  
  end

  def create
    @sendbuy = SendBuy.new(send_params)
    if @sendbuy.valid?
       @sendbuy.save
       redirect_to root_path
    else
       @item = Item.find(params[:item_id])
       render :index, status: :unprocessable_entity
    end
  end
    private
    def send_params
      params.require(:send_buy).permit(:postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end