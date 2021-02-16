class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
      @item = Item.new
    end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    find_params
  end

  def edit
    find_params
  end

  def update
    find_params
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_status_id,
                                 :scheduled_delivery_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    item = Item.find(params[:id])
    unless current_user == item.user
      redirect_to action: :index
    end
  end

end
