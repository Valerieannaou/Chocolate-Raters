class AddStatusToChocolatiers < ActiveRecord::Migration
  def change
    add_column :chocolatiers, :status, :integer
  end
end
