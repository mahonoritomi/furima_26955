class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
    
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :condition_id, :delivery_fee_id, :ship_from_id, :transport_days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
