class ItemsController < ApplicationController
  def index
    @items = Item.all
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :condition_id, :delivery_fee_id, :ship_from_id, :transport_days_id).merge(user_id: current_user.id)
  end

end
