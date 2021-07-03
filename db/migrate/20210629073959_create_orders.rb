class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total
      t.boolean :ispaid
      t.integer :table_id
      t.integer :user_id
      t.timestamps
    end
  end
end
