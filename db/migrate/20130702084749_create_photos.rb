class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :chocolate_id

      t.timestamps
    end
  end
end
