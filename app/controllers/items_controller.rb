class ItemsController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(params[:item]) 

    if @item.save!
      redirect_to category_path(@category)
    else
    end 
  end

  def update
    @item = Item.find(params[:id])
# CHECKS TO SEE CURRENT STATE OF ITEM 
    if @item.in_stock?
      @item.nearly_consumed
    elsif @item.low_stock?
      @item.consumed 
    else @item.out_of_stock?
# CHECKS TO SEE IF USER IS ADMIN 
# ONLY ADMIN CAN CHANGE STATE FROM OUT OF STOCK TO IN STOCK
      if current_user.admin?
        @item.replenished
      end
    end
    
    if @item.update_attributes(params[:state])
      redirect_to categories_path
    else
      redirect_to root_path
    end
  end
end
