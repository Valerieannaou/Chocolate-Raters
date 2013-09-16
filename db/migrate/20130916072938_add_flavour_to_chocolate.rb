class AddFlavourToChocolate < ActiveRecord::Migration
  def change
    add_column :chocolates, :flavour, :string
  end
end
