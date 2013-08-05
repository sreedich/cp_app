class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false 
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
