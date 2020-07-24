class PurchasesController < ApplicationController
  before_action :set_item

  def new
    if Purchase.exists?(item_id: @item.id) || @item.user.id == current_user.id
      redirect_to root_path
    else
      @purchase = AddressPurchase.new
    end
  end

  def create
    @purchase = AddressPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  def purchase_params
    params.permit(:token, :address_id, :zipcode, :prefecture_id, :city, :address_line, :phone_number, :building).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end
