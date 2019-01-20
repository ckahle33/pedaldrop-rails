class AddPaidFlagToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :paid, :boolean, default: false
  end
end
