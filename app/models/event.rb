class Event < ActiveRecord::Base
  attr_accessible :item_id, :state, :time
  validates_presence_of :item_id, :state, :time 
  belongs_to :items 
end
