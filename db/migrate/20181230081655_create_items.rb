class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :item_type
      t.text :description
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end
