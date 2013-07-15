class AddColumnToChocolates < ActiveRecord::Migration
  def change
    add_column :chocolates, :chocolatier_id, :integer
  end
end
