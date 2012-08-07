class ChangeColumnTypeOnActivities < ActiveRecord::Migration
  def up
    rename_column :activities, :type, :activity_type
  end

  def down
    rename_column :activities, :activity_type, :type
  end
end
