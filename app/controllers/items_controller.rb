class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new,:create,:edit,:update]
  before_action :get_item, only: [:show,:edit,:update]
  before_action :ensure_correct_user, only:[:edit, :update]

  def index
    @items = Item.includes(:user).order(id: "DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_parameter)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def item_parameter
    params.require(:item).permit(:name,:explanation, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end

  def ensure_correct_user
    if current_user.id != @item.user.id
      redirect_to root_path

    end
  end
end
