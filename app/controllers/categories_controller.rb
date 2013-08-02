class CategoriesController < ApplicationController

  def index
    @category = Category.all 
  end
  
  def new
    @category = Category.new 
  end

  def create
    @category = Category.new(params[:category])

     if @category.save!
      redirect_to categories_path, notice: 'category successfully created'
    else
      render action: 'new'
    end 

  end



end
