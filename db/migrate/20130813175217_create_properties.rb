class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name, null: false 
      t.string :address, null: false 
      t.string :city, null: false 
      t.string :state, null: false 
      t.integer :zip, null: false 

      t.timestamps
    end
  end
end
