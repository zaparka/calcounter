class AddTotalDistanceToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :total_distance, :float
  end
end
