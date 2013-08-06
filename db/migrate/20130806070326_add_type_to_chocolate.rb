class AddTypeToChocolate < ActiveRecord::Migration
  def change
    add_column :chocolates, :bar_type, :string
    add_column :chocolates, :bar_state, :string
  end
end
