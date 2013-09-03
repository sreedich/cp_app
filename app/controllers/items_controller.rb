class ItemsController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(params[:item])
    @event = @category.items.last
    
    if @item.save!    
      redirect_to #
      Event.create(time: @event.created_at, state: @event.state, item_id: @event.id)
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
      redirect_to :back
      Event.create(time: @item.updated_at, state: @item.state, item_id: @item.id)
    else
      redirect_to root_path
    end
  end
end
