class AddColumnToChocolate < ActiveRecord::Migration
  def change
    add_column :chocolates, :type_of_chocolate, :string
    add_column :chocolates, :cocao, :float

  end
end
