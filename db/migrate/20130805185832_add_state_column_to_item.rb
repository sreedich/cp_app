class AddStateColumnToItem < ActiveRecord::Migration
  def up
    add_column :items, :state, :string 
  end

  def down
    remove_column :items, :state 
  end 
end
