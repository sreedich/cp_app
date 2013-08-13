class Item < ActiveRecord::Base
  attr_accessible :category_id, :name, :state 
  validates_presence_of :category_id, :name 
  belongs_to :category 
  has_many :events, dependent: :destroy

state_machine initial: :in_stock do 
  
  event :consumed do 
    transition :low_stock => :out_of_stock 
  end 

  event :nearly_consumed do
    transition :in_stock => :low_stock
  end

  event :replenished do 
    transition :out_of_stock => :in_stock
  end 
end 

end

