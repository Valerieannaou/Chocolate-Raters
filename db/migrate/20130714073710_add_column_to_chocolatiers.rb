class AddColumnToChocolatiers < ActiveRecord::Migration
  def change
    add_column :chocolatiers, :user_id, :integer
  end
end
