class AddUserIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :user_id, :integer, :null=>false
  end
end
