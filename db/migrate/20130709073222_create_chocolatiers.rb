class CreateChocolatiers < ActiveRecord::Migration
  def change
    create_table :chocolatiers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :state
      t.string :zip_code
      t.string :chocolatier_type
      t.string :chocolatier_url
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
