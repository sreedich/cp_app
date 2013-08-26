class CategoriesController < ApplicationController

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
    @property = Property.find(params[:property_id])
    @category = @property.categories.build(params[:category])

  end

  def create
    @property = Property.find(params[:property_id])
    @category = @property.categories.new(params[:category])

     if @category.save!
      redirect_to property_path(@property), notice: 'category successfully created'
    else
      render action: 'new'
    end 

  end



end
