class Category < ActiveRecord::Base
  attr_accessible :title
  # validate_precense_of :title 
end
