class CategoriesController < ApplicationController
load_and_authorize_resource

  def index
    @category = Category.all
     
  end

  def show
    @category = Category.find(params[:id])
    @item = @category.items.new

    # if @category.items.save
    #   redirect_to root_path
    # end

    
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
