class Item < ActiveRecord::Base
  attr_accessible :category_id, :name, :state 
  validates_presence_of :category_id, :name 
  belongs_to :category 

state_machine initial: :in_stock do 
  event :consumed do 
    transition :in_stock => :out_of_stock 
  end 

  event :replenished do 
    transition :out_of_stock => :in_stock
  end 


end 

end

