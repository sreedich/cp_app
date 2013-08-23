class AddColumnToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :property_id, :integer, null: false 
  end

  def down 
    remove_column :categories, :property_id
  end 
end
