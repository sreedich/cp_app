class PropertiesController < ApplicationController 

  def index
    @properties = Property.all
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

end 
