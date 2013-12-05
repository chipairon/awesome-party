class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :title
      t.string :permalink
      t.integer :user_id

      t.timestamps
    end
  end
end
