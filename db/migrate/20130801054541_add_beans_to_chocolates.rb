class AddBeansToChocolates < ActiveRecord::Migration
  def change
    add_column :chocolates, :beans, :text
  end
end
