class AddDistanceUnitToUser < ActiveRecord::Migration
  def change
    add_column :users, :distance_unit, :string
  end
end
