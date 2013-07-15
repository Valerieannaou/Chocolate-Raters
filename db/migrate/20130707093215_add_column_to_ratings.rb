class AddColumnToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :look, :float
    add_column :ratings, :smell, :float
    add_column :ratings, :snap, :float
    add_column :ratings, :mouthfeel, :float
    add_column :ratings, :taste, :float
    add_column :ratings, :aftertaste, :float
    add_column :ratings, :comment, :text
  end
end
