class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.integer :doorkeeper_uid
      t.string :doorkeeper_access_token
      t.string :email

      t.timestamps
    end

    add_index :users, :doorkeeper_uid, :unique => true
    add_index :users, :doorkeeper_access_token, :unique => true
  end
end
