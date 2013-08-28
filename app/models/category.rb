
class Category < ActiveRecord::Base
  attr_accessible :title, :property_id
  validates_presence_of :title, :property_id
  has_many :items, dependent: :destroy
  belongs_to :property
end
