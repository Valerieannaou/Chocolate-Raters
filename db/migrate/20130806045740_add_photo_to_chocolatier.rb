class AddPhotoToChocolatier < ActiveRecord::Migration
  def change
    add_column :chocolatiers, :photo, :string
  end
end
