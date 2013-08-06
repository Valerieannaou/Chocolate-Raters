class AddBusinessHourToChocolatier < ActiveRecord::Migration
  def change
    add_column :chocolatiers, :business_hour, :string
  end
end
