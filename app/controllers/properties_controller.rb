class PropertiesController < ApplicationController 

  def index
    @properties = Property.all
    @property = Property.new
  end

  def new 
    @property = Property.new 
  end 

  def create
    @property = Property.create(params[:property])

      if @property.save!
      redirect_to properties_path, notice: 'property successfully created'
    else
      render action: 'new'
    end 
  end

  def show
    @property = Property.find(params[:id])
    @category = Category.new 
    @item = Item.new 
  end 

end 
