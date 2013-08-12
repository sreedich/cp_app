class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time, null: false 
      t.string :state, null: false 
      t.integer :item_id, null: false 

      t.timestamps
    end
  end
end
