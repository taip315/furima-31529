class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
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
end
