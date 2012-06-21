class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :twitter
      t.string :uid
      t.string :provider
      t.string :runkeeper

      t.timestamps
    end
  end
end
