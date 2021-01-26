class OrdersController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :get_item
  before_action :correct_access
  
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
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

  def get_item
    @item = Item.find(params[:item_id])
  end

  def correct_access
    if (current_user.id == @item.user.id) || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
