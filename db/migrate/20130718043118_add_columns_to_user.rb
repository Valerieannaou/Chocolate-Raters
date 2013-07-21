class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string
    add_column :users, :user_name, :string
    add_column :users, :fb_photo, :string
  end
end
