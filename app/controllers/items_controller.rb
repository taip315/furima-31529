class ItemsController < ApplicationController
 
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def item_parameter
    params.require(:item).permit(:name,:explanation, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id, image: params[:image])
  end
end
