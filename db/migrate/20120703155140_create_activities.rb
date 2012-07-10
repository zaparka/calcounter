class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :uri
      t.integer :calories
      t.string :type
      t.string :start_time

      t.timestamps
    end
  end
end
