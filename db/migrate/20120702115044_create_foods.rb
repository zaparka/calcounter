class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.integer :portion_size
      t.string :unit

      t.timestamps
    end
  end
end
