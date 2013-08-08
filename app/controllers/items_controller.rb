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

    if @item.out_of_stock?
      if current_user.admin?
        @item.replenished
      end
    else
      @item.consumed
    end
    
    if @item.update_attributes(params[:state])
      redirect_to categories_path
    else
      redirect_to root_path
    end
  end

end
