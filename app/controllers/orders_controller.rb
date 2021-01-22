class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item_and_orderform
  before_action :correct_access
  
  def index
  end

  def create
    
    if @order_form.valid?
      pay_item(@item)
      @order_form.save(current_user.id, @item.id)
      redirect_to root_path
    else
      render :index
    end
  end

private

  def order_params
    params.require(:order_form).permit(:postal_number, :prefecture_id, :municipality, :address, :building, :phone_number).merge(token: params[:token])
  end

  def pay_item(item)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def get_item_and_orderform
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def correct_access
    if (current_user.id == @item.user.id) || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end


end
