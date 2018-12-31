class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :confirmation_token
      t.string :username
      t.datetime :confirmed_at
      t.string :reset_token

      t.timestamps
    end
  end
end
