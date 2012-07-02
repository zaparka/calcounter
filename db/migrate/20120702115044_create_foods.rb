class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, :null=>false
      t.integer :calories, :null=>false
      t.integer :portion_size, :null=>false
      t.string :unit, :null=>false

      t.timestamps
    end
  end
end
