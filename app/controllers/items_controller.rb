class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order("created_at ASC")
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

  private

  def item_params
    params.require(:item).permit(:image,:name,:description_of_item,:category_id,:product_condition_id,:shipping_charge_id,:prefecture_id,:days_to_ship_id,:price, ).merge(user_id: current_user.id)
  end
end
