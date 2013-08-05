class ItemsController < ApplicationController



  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(params[:item]) 

    if @item.save!
      redirect_to category_path(@category)
    else
    end 
  end

end
