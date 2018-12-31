class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.text :description

      t.timestamps
    end
  end
end
