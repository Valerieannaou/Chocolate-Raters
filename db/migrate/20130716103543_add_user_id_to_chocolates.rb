class AddUserIdToChocolates < ActiveRecord::Migration
  def change
    add_column :chocolates, :user_id, :integer
  end
end
