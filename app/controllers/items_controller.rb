class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :item_condition_id, :shipping_cost_id, :shipping_origin_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end