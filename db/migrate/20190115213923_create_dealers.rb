class CreateDealers < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
