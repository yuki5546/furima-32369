class TransactionItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[index, create]
  before_action :find_params, only: %i[create]
  before_action :move_to_index, only: %i[index, create]

  def index
    @order = Order.new
    find_params
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture, :address, :city, :building, :phone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == item.user || item.transaction_item.presence
  end
end
