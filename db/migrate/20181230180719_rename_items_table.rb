class RenameItemsTable < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :items, :products
  end

  def self.down
    rename_table :products, :items
  end
end
