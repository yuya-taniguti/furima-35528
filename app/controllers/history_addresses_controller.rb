class HistoryAddressesController < ApplicationController
  before_action :set_item, only: [:create, :index]
  before_action :authenticate_user!, only: [:create, :index]
  before_action :move_to_index, only: [:create, :index]

  def index
    @history_address = HistoryAddress.new
  end

  def create
    @history_address = HistoryAddress.new(history_address)
    if @history_address.valid?
      pay_item
      @history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_address
    params.require(:history_address).permit(:postal_code, :regional_id, :municipality, :address, :phone_number, :building_name).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || !@item.history.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: history_address[:token],
      currency: 'jpy'
    )
  end
end
