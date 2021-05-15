class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :state_id, :postage_id, :regional_id, :shipping_data_id,:price).merge(user_id: current_user.id)
  end
end
